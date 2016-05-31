#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, default_app, get, post, run, template, error, request, static_file, response
import json
import requests
import tweepy
import requests
from requests_oauthlib import OAuth1
from urlparse import parse_qs

APIKey = {"api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}

@route('/')
def index():
	#Pagina Principal - Donde se muestra el estado del servidor, la version del juego y los campeones gratuitos de la semana
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
	summonerName = summonerName.replace(" ","")
	urlmasname = "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/"+summonerName
	getid = requests.get(urlmasname,params=APIKey)
	ID = 0
	name = ""
	nivel = 0
	urlimageicon = ""
	if getid.status_code == 200:
		identificadorJSON = json.loads(getid.text)
		ID = identificadorJSON[summonerName]['id']
		ID = str(ID)
		name = identificadorJSON[summonerName]['name']
		nivel = identificadorJSON[summonerName]['summonerLevel']
		urlimageicon = "http://avatar.leagueoflegends.com/summonerId/euw/"+ ID + ".png"


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
		color = "verde"
	else:
		isplaying = "No esta jugando ninguna partida en este momento"
		color = "rojo"

	# Sacar liga y division del jugador RANKED SOLO 5X5
	URL1 = "https://euw.api.pvp.net/api/lol/euw/v2.5/league/by-summoner/"+str(ID)+"/entry"
	getleague = requests.get(URL1,params=APIKey)
	# Valores por defecto si no existen
	leagueofpoints5x5 = "No rating"
	tier5x5 = "unknown"
	losses5x5 = 0
	wins5x5 = 0
	division5x5 = "unknown"

	if getleague.status_code == 200:
		getleagueJSON = json.loads(getleague.text)
		tier5x5 = getleagueJSON[ID][0]['tier']
		division5x5 = getleagueJSON[ID][0]['entries'][0]['division']
		division5x5 = str(tier5x5) + " " + str(division5x5)
		tier5x5 = tier5x5.lower()+"_1"
		leagueofpoints5x5 = getleagueJSON[ID][0]['entries'][0]['leaguePoints']
		leagueofpoints5x5 = str(leagueofpoints5x5) + " LP"
		losses5x5 = getleagueJSON[ID][0]['entries'][0]['losses']
		wins5x5 = getleagueJSON[ID][0]['entries'][0]['wins']

	#Estadisticas de las partidas ARAM y URF

	chorizaco = "https://euw.api.pvp.net/api/lol/euw/v1.3/stats/by-summoner/"+str(ID)+"/summary?season=SEASON2016"

	getARAM = requests.get(chorizaco,params=APIKey)

	#Definiendo variables antes

	winsARAM = 0
	championkillsARAM = 0
	totalAssistsARAM = 0

	winsURF = 0
	championkillsURF = 0
	totalAssistsURF = 0

	if getARAM.status_code == 200:
		getARAMJSON = json.loads(getARAM.text)
		for elemento in range(len(getARAMJSON['playerStatSummaries'])):
			if getARAMJSON['playerStatSummaries'][elemento]['playerStatSummaryType'] == "AramUnranked5x5":
				winsARAM = getARAMJSON['playerStatSummaries'][elemento]['wins']
				championkillsARAM = getARAMJSON['playerStatSummaries'][elemento]['aggregatedStats']['totalChampionKills']
				totalAssistsARAM = getARAMJSON['playerStatSummaries'][elemento]['aggregatedStats']['totalAssists']

			if getARAMJSON['playerStatSummaries'][elemento]['playerStatSummaryType'] == "URF":
							winsURF = getARAMJSON['playerStatSummaries'][elemento]['wins']
							championkillsURF = getARAMJSON['playerStatSummaries'][elemento]['aggregatedStats']['totalChampionKills']
							totalAssistsURF = getARAMJSON['playerStatSummaries'][elemento]['aggregatedStats']['totalAssists']

	return template('summoner.tpl',ID=ID,totalAssistsURF=totalAssistsURF,championkillsURF=championkillsURF,winsURF=winsURF,winsARAM=winsARAM,championkillsARAM=championkillsARAM,totalAssistsARAM=totalAssistsARAM, name=name, nivel=nivel, urlimageicon=urlimageicon, isplaying=isplaying, color=color, leagueofpoints=leagueofpoints5x5, tier5x5=tier5x5, losses5x5=losses5x5, wins5x5=wins5x5, division5x5=division5x5)


@route('/history/<ID>')
def recents(ID=''):
	URL = "https://euw.api.pvp.net/api/lol/euw/v1.3/game/by-summoner/%s/recent"%ID
	getHISTORY = requests.get(URL,params=APIKey)
	history = []

	if getHISTORY.status_code == 200:
		getHISTORYJSON = json.loads(getHISTORY.text)
		for elemento in range(5):
			partida = {}
			gameMode = getHISTORYJSON['games'][elemento]['gameMode']
			championId = getHISTORYJSON['games'][elemento]['championId']
			spell1 = getHISTORYJSON['games'][elemento]['spell1']
			spell2 = getHISTORYJSON['games'][elemento]['spell2']
			goldEarned = getHISTORYJSON['games'][elemento]['stats']['goldEarned']
			
			

			if getHISTORYJSON['games'][elemento]['stats'].has_key('numDeaths'):
				numDeaths = getHISTORYJSON['games'][elemento]['stats']['numDeaths']
			else:
				numDeaths = "0"

			if getHISTORYJSON['games'][elemento]['stats'].has_key('assists'):
				assists = getHISTORYJSON['games'][elemento]['stats']['assists']
			else:
				assists = "0"

			if getHISTORYJSON['games'][elemento]['stats'].has_key('championsKilled'):
				championsKilled = getHISTORYJSON['games'][elemento]['stats']['championsKilled']
			else:
				championsKilled = "0"
				
			if getHISTORYJSON['games'][elemento]['stats'].has_key('minionsKilled'):
				minionsKilled = getHISTORYJSON['games'][elemento]['stats']['minionsKilled']
			else:
				minionsKilled = "0"

			win = getHISTORYJSON['games'][elemento]['stats']['win']
			timePlayed = getHISTORYJSON['games'][elemento]['stats']['timePlayed']
			team = getHISTORYJSON['games'][elemento]['stats']['team']
			summonerId = getHISTORYJSON['summonerId']
			#Objetos comprados


			# Guardando los valores en el diccionario

			partida['gameMode'] = gameMode
			partida['championId'] = championId
			partida['spell1'] = spell1
			partida['spell2'] = spell2
			partida['goldEarned'] = goldEarned
			partida['assists'] = assists
			partida['numDeaths'] = numDeaths
			partida['championsKilled'] = championsKilled
			partida['minionsKilled'] = minionsKilled 
			partida['win'] = str(win)
			partida['timePlayed'] = int(timePlayed/60)
			partida['team'] = team

			players100 = {}
			players200 = {}

			for i in range(len(getHISTORYJSON['games'][elemento]['fellowPlayers'])):
				
				if getHISTORYJSON['games'][elemento]['fellowPlayers'][i]['teamId'] == 100:

					championId = getHISTORYJSON['games'][elemento]['fellowPlayers'][i]['championId']
					summonerId = getHISTORYJSON['games'][elemento]['fellowPlayers'][i]['summonerId']
					players100[summonerId] = championId

				else:

					championId = getHISTORYJSON['games'][elemento]['fellowPlayers'][i]['championId']
					summonerId = getHISTORYJSON['games'][elemento]['fellowPlayers'][i]['summonerId']
					players200[summonerId] = championId					

			partida['team100'] = players100
			partida['team200'] = players200

			history.append(partida)
	return template('history.tpl',check=history)


@route('/championswithS/<ID>')
def full(ID=''):

	# Conseguir los campeones con S
	URL = "https://euw.api.pvp.net/championmastery/location/EUW1/player/%s/champions"%ID
	getS = requests.get(URL,params=APIKey)

	# Sacar el nombre del jugador
	URL1 = "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/%s"%ID
	getname = requests.get(URL1,params=APIKey)

	name = ""

	if getname.status_code == 200:
		getnameJSON = json.loads(getname.text)
		name = getnameJSON[ID]['name']
	#Conseguir los nombres de las imagenes de cada campeon para construir la URL de la imagen

	payload1 = {"champData":"image","api_key":"30ed66a9-fe04-4b57-ad61-871f1995cfb2"}
	url = requests.get('https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion',params=payload1)
	Schamps = []
	iconos = []


	if getS.status_code == 200:
		getSJSON = json.loads(getS.text)

		for e in range(len(getSJSON)):
			if getSJSON[e].has_key('highestGrade'):
				if getSJSON[e]['highestGrade'] == "S" or getSJSON[e]['highestGrade'] == "S+" or getSJSON[e]['highestGrade'] == "S-":
					championId = getSJSON[e]['championId']
					Schamps.append(championId)

	if url.status_code == 200:
		imagenes = json.loads(url.text)
	
		for i in imagenes['data']:

			if imagenes['data'][i]['id'] in Schamps:
				imagefull = imagenes['data'][i]['image']['full']
				rutaimagen = "http://ddragon.leagueoflegends.com/cdn/6.10.1/img/champion/" + imagefull
				iconos.append(rutaimagen)

	return template('s.tpl', iconos=iconos,invocador=name)

#Vamos a tweetear!

@get('/escribepost')
def twittear():
	return template('tweet.tpl') 

@route('/postear',method='POST')
def postea():
	cfg = { 
		"consumer_key": "cM9oUgu36V8Mh8b3guTqkuIQO",
		"consumer_secret": "HRQzNTjF6Nq0yj588A9FQ2DlN9wKEQjFnEhUrTUKPu0GQY0Ccx",
		"access_token": "737730447631888385-zO6Fyv2OxQ6vAyRbW1F79Z5YLZUTp2h",
		"access_token_secret": "596lJOZqKqMOBc8vbnIkwp2Yxuze92KqlIClAe7o1oneS" 
	}
	auth = tweepy.OAuthHandler(cfg['consumer_key'], cfg['consumer_secret'])
 	auth.set_access_token(cfg['access_token'], cfg['access_token_secret'])
	#tweet = request.forms.get("tweet")
	tweet = "Probando api.."
	status = tweepy.API(auth).update_status(status=tweet)
	return template('index.tpl')

# FIN TWEET

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
