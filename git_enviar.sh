#!/bin/bash

#Defina aqui o nome de seu repositório:
REPOSITORIO=<user>

git checkout master
git pull
git merge $REPOSITORIO
git push

