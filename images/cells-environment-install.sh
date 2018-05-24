#!/bin/bash

clear
echo "-- 2018/04/19 -----------------------------------------------------------------------------"
echo "-- INSTALACIÓN DE HERRAMIENTAS CELLS ------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------"
# VERSIONES
curl_version="7.47.0"
git_version="2.7.4"
git_flow_version="1.9.1"
nvm_version="0.33.8"
node_version="v6.12.3"
npm_version="3.10.10"
bower_version="1.8.4"
cells_version="2.0.3"

echo ""
echo "LIMPIAMOS PAQUETES ------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------"
echo "sudo apt autoremove"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Ee]$ ]]
then
	exit 0
fi
if [[ $REPLY =~ ^[Ss]$ ]]
then
	sudo apt autoremove
fi

echo ""
echo "INSTALAR CURL *****************************************************************************"
if [[ "$(curl --version)" =~ $curl_version ]]
then
	echo "curl ya está instalado correctamente."
else
	echo "CURL no está instalado."
	echo "INSTALAMOS CURL?"
	echo "-----------------------------------------------------------------------------------------"
	echo "sudo apt-get install curl"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		sudo apt-get install curl
	fi
fi
echo "curl --version"
curl --version

echo ""
echo "INSTALAR GIT ******************************************************************************"
if [[ "$(git --version)" =~ $git_version ]]
then
	echo "git ya está instalado correctamente."
else
	echo "GIT no está instalado."
	echo "INSTALAMOS GIT?"
	echo "-----------------------------------------------------------------------------------------"
	echo "sudo apt-get install git"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		sudo apt-get install git
	fi
fi
echo "git --version"
git --version

echo ""
echo "INSTALAR GIT FLOW *************************************************************************"
if [[ "$(git flow version)" =~ $git_flow_version ]]
then
	echo "GIT FLOW ya está instalado correctamente."
else
	echo "GIT FLOW no está instalado."
	echo "INSTALAMOS GIT FLOW?"
	echo "-----------------------------------------------------------------------------------------"
	echo "sudo apt-get install git-flow"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		sudo apt-get install git-flow
	fi
fi
echo "git flow version"
git flow version

echo ""
echo "INSTALAR NVM ******************************************************************************"
# ANTES DE PODER USAR nvm EN EL SCRIPT, debemos agregarlo a sources:
# Si existe la carpeta .nvm, la agregamos a los sources:
if [ -d ~/.nvm ]; then
	export NVM_DIR=$HOME/.nvm;
	source $HOME/.nvm/nvm.sh;
fi

if [[ "$(nvm --version)" == $nvm_version ]]
then
	echo "nvm ya está instalado en su versión correcta."
else
	echo "NVM no está instalado."
	echo "INSTALAMOS NVM?"
	echo "sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash";
	echo "-----------------------------------------------------------------------------------------"
	read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
		export NVM_DIR=$HOME/.nvm;
		source $HOME/.nvm/nvm.sh;
	fi
fi
echo "nvm --version"
nvm --version

echo ""
echo "INSTALAR NODE *****************************************************************************"
if [[ "$(node -v)" == $node_version ]]
then
	echo "node ya está instalado en su versión correcta."
else
	echo "NODE no está instalado."	
	echo "INSTALAMOS NODE?"
	echo "-----------------------------------------------------------------------------------------"
	echo "nvm install v6.12.3"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		nvm install v6.12.3
		nvm alias default 6.12.3
		nvm use default
		
	fi
fi
echo "node -v"
node -v
echo "npm -v"
npm -v

echo ""
echo "INSTALAR BOWER ****************************************************************************"
if [[ "$(bower -v)" == $bower_version ]]
then
	echo "Bower ya está instalado en su versión correcta."
else
	echo "BOWER no está instalado."
	echo "INSTALAMOS BOWER?"
	echo "-----------------------------------------------------------------------------------------"
	echo "npm install -g bower;"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		npm install -g bower;
		npm install -g bower-art-resolver
		echo "No olvidar crear el fichero ~/.bowerrc si no existe y agregar json:"
		echo "{"
		echo "  registry": "https://<USER>:<API_KEY>@globaldevtools.bbva.com/artifactory/api/bower/bower-repo",
		echo "  resolvers": [
		echo "    bower-art-resolver"
		echo "  ]"
		echo "}"
		echo "Agregar <USER>:<API_KEY>"
		echo "Obtener api_key de https://globaldevtools.bbva.com/artifactory/webapp/#/profile"
	fi
fi
echo "bower -v"
bower -v

echo ""
echo "INSTALAR CELLS ****************************************************************************"
if [[ "$(cells --version)" == $cells_version ]]
then
	echo "CELLS ya está instalado en su versión correcta."
else
	echo "CELLS no está instalado."
	echo "INSTALAMOS CELLS?"
	echo "-----------------------------------------------------------------------------------------"
	echo "npm i -g cells-cli"; read -p "¿Ejecutar? (S/n/Exit)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Ee]$ ]]
	then
		exit 0
	fi
	if [[ $REPLY =~ ^[Ss]$ ]]
	then
		npm i -g cells-cli
	fi
fi
echo "cells -v"
cells -v

echo "-------------------------------------------------------------------------------------------"
echo "-- FIN SCRIPT. Instalación completada. ----------------------------------------------------"
echo "-------------------------------------------------------------------------------------------"
echo "-- CIERRA ESTE TERMINAL Y ABRE UN TERMINAL NUEVO PARA CONTINUAR. --------------------------"
echo "-------------------------------------------------------------------------------------------"
