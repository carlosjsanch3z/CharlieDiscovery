#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, default_app, get, post, run, template, error, request, static_file, response
import json
import requests

#Pagina Principal - Donde se muestra el estado del servidor, la version del juego y los campeones gratuitos de la semana

@route('/')
def index():

	APIKey = {"api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}
	#Sacar los IDS de los campeones que estan gratuitos para jugar esta semana
	payload = {"freeToPlay":"true","api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}
	freechamps = requests.get('https://euw.api.pvp.net/api/lol/euw/v1.2/champion',params=payload)
	freetoplays = []
	if freechamps.status_code == 200:
		gratuitos = json.loads(freechamps.text)

		for ch in gratuitos['champions']:
			if ch['freeToPlay'] == True:
				ide = ch['id']
				freetoplays.append(ide)

	#Conseguir los nombres de las imagenes de cada campeon para construir la URL de la imagen

	payload1 = {"champData":"image","api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}
	url = requests.get('https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion',params=payload1)
	iconos = []
	if url.status_code == 200:
		imagenes = json.loads(url.text)
	
		for i in imagenes['data']:

			if imagenes['data'][i]['id'] in freetoplays:
				imagefull = imagenes['data'][i]['image']['full']
				rutaimagen = "http://ddragon.leagueoflegends.com/cdn/6.10.1/img/champion/" + imagefull
				iconos.append(rutaimagen)

	#Conseguir la última versión del juego de una lista

	requestversion = requests.get('https://global.api.pvp.net/api/lol/static-data/euw/v1.2/versions',params=APIKey)
	if requestversion.status_code == 200:
		getversion = json.loads(requestversion.text)
		lastversion = str(getversion[0])


	# Conseguir los estados del servidor, tienda, pagina web, cliente
	game={}
	status = requests.get('http://status.leagueoflegends.com/shards/euw')
	if status.status_code == 200:
		estados = json.loads(status.text)

		for elemento in xrange(4):
			key = estados['services'][elemento]['name']
			value = estados['services'][elemento]['status']
			# Para ver que funciona el color rojo en el CSS en caso de offline
			if key == 'Client':
				value = 'offline'
			game[key] = value

	return template('index.tpl', free=freetoplays, iconos=iconos, version=lastversion, game=game)







@route('/summoner', method="POST")
def infosummoner():

	APIKey = {"api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}
	#Consigue el ID del invocador
	summonerName = request.forms.get('summoner')
	summonerName = str(summonerName)
	summonerName = summonerName.lower()
	urlmasname = "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/"+summonerName
	getid = requests.get(urlmasname,params=APIKey)
	ID = 0
	if getid.status_code == 200:
		identificadorJSON = json.loads(getid.text)
		ID = identificadorJSON[summonerName]['id']
		ID = str(ID)
		name = identificadorJSON[summonerName]['name']
		icon = identificadorJSON[summonerName]['profileIconId']
		nivel = identificadorJSON[summonerName]['summonerLevel']
		urlimageicon = "http://lkimg.zamimg.com/images/v2/summoner/icons/size64x64/"+ str(icon) + ".png"


	# Consultar si el jugador esta jugando una partida o no, tipo de partida y con que campeon

	colocarID = "https://euw.api.pvp.net/observer-mode/rest/consumer/getSpectatorGameInfo/EUW1/"+ str(ID)
	playing = requests.get(colocarID,params=APIKey)

	if playing.status_code == 200:
		playingJSON = json.loads(playing.text)
		gameandchamp = []
		gamemode = playingJSON['gameMode']
		gameandchamp.append(gamemode)
		for elemento in range(len(playingJSON['participants'])):
			if playingJSON['participants'][elemento]['summonerName'] == name:
				whatchampisplaying = playingJSON['participants'][elemento]['championId']

		# Ver el nombre del campeon con el que esta jugando con el ID sacado antes

		champSEARCH = "https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion/"+ str(whatchampisplaying)
		givemethename = requests.get(champSEARCH,params=APIKey)

		if givemethename.status_code == 200:
			champNAME = json.loads(givemethename.text)
			namechisplaying = champNAME['name']
			gameandchamp.append(namechisplaying)

		isplaying = "Esta en una partida " + str(gameandchamp[0]) + " jugando " + str(gameandchamp[1])
	else:
		isplaying = "No esta jugando ninguna partida en este momento"




	return template('summoner.tpl', name=name, nivel=nivel, urlimageicon=urlimageicon, isplaying=isplaying)
	# queue -> RANKED_SOLO_5x5
	# nombre de la liga 
	# entries -> leaguePoints , division , losses , playerOrTeamName, wins

	# tier


	

	# Estadisticas de las partidas en la season actual
	# URL6 = "https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/" + ID + "/summary?season=SEASON2016&api_key=" + APIKey

	# response6 = requests.get(URL6)
	#response6JSON = response6.json()

	#stats = response6JSON['playerStatSummaries']


@route('/summoner')
def fail():
	return "No esta accediendo mediante el metodo POST"

#No se ha encontrado la página
@error(404)
def error(error):
    return "Error 404"


# Contenido Estatico
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=os.environ['OPENSHIFT_REPO_DIR']+"wsgi/static")
# This must be added in order to do correct path lookups for the views
import os
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], 'wsgi/views/')) 

application=default_app()
