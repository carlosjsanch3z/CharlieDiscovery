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
			# 
			if key == 'Client':
				value = 'offline'
			game[key] = value



	return template('index.tpl', free=freetoplays, iconos=iconos, version=lastversion, game=game)







@route('/summoner', method="POST")
def infosummoner():
	return template('summoner.tpl')

	# queue -> RANKED_SOLO_5x5
	# nombre de la liga 
	# entries -> leaguePoints , division , losses , playerOrTeamName, wins

	# tier






	#APIKey = "30ed66a9-fe04-4b57-ad61-871f1995cfb2"
	#region = "euw"
	#summonerName = request.forms.get('summoner')
	#summonerName = str(summonerName)
	#summonerName = summonerName.lower()

	#Consigue el ID del invocador
	#URL = "https://" + region + ".api.pvp.net/api/lol/" + region + "/v1.4/summoner/by-name/" + summonerName + "?api_key=" + APIKey
	#response = requests.get(URL)
	#responseJSON = response.json()
	#ID = responseJSON[summonerName]['id']
	#ID = str(ID)
	# Conseguir el nivel del jugador y el ID del icono de perfil
	#URL2 = "https://" + region + ".api.pvp.net/api/lol/" + region + "/v1.4/summoner/" + ID + "?api_key=" + APIKey
	#response2 = requests.get(URL2)
	#response2JSON = response2.json()
	#level = response2JSON[ID]['summonerLevel']
	#level = str(level)
	#profileiconID = response2JSON[ID]['profileIconId']
	#profileiconID = str(profileiconID)
	#urlimageicon = "http://lkimg.zamimg.com/images/v2/summoner/icons/size64x64/"+ profileiconID + ".png"



	


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
