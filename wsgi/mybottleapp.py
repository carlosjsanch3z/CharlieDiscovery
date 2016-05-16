#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, default_app, get, post, run, template, error, request, static_file, response
import requests

#Pagina Principal

@route('/')
def index():
    return template('index2.tpl')

#Pagina donde devuelve la información del jugador

@route('/summoner', method="POST")
def infosummoner():
	APIKey = "30ed66a9-fe04-4b57-ad61-871f1995cfb2"
	region = "euw"
	summonerName = request.forms.get('summoner')
	summonerName = str(summonerName)
	summonerName = summonerName.lower()

	#Consigue el ID del invocador
	URL = "https://" + region + ".api.pvp.net/api/lol/" + region + "/v1.4/summoner/by-name/" + summonerName + "?api_key=" + APIKey
	response = requests.get(URL)
	responseJSON = response.json()
	ID = responseJSON[summonerName]['id']
	ID = str(ID)
	# Conseguir el nivel del jugador y el ID del icono de perfil
	URL2 = "https://" + region + ".api.pvp.net/api/lol/" + region + "/v1.4/summoner/" + ID + "?api_key=" + APIKey
	response2 = requests.get(URL2)
	response2JSON = response2.json()
	level = response2JSON[ID]['summonerLevel']
	level = str(level)
	profileiconID = response2JSON[ID]['profileIconId']
	profileiconID = str(profileiconID)
	urlimageicon = "http://lkimg.zamimg.com/images/v2/summoner/icons/size64x64/"+ profileiconID + ".png"

	if response.status_code == 200 and response2.status_code == 200:
		return template('summoner.tpl', identificador=ID, invocador=summonerName, nivel=level, icono=urlimageicon )
	elif response.status_code == 404:
		notfound = "El nombre de invocador introducido no se encuentra en la region EUW."
		return template('index2', notfound=notfound)
	else:
		return template('index2', notfound=notfound)

	#return template('index.tpl', identificador=ID, invocador=summonerName)





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
