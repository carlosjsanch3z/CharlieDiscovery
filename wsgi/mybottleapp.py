#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, default_app, get, post, run, template, error, request, static_file, response


#Pagina Principal
@route('/')
def index():
    return template('index2.tpl')


#Pagina donde devuelve la información del jugador
@route('/', method="POST")
def get_info():
	APIKey = "30ed66a9-fe04-4b57-ad61-871f1995cfb2"
	region = "euw"
	summonerName = str(request.forms.get('summoner'))
	r = "https://" + region + ".api.pvp.net/api/lol/" + region + "/v1.4/summoner/by-name/" + summonerName + "?api_key=" + APIKey

	return template('index.tpl')
#Si accede a la pagina /summoner sin el metodo POST




#No se ha encontrado la página
@error(404)
def error(error):
    return "Error 404 papito"


# Contenido Estatico
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=os.environ['OPENSHIFT_REPO_DIR']+"wsgi/static")
# This must be added in order to do correct path lookups for the views
import os
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], 'wsgi/views/')) 

application=default_app()
