#!/bin/bash

# CAMBIAR VARIABLES POR DEFECTO SEGUN EL PROYECTO
PROJECT_NAME="my-project"
REPO_URL="https://github.com/Blaze-OTP/doodba_odoo17"
BRANCH="17.0"

read -p "Ingrese el nombre del proyecto [$PROJECT_NAME]: " input
PROJECT_NAME=${input:-"$PROJECT_NAME"}
read -p "Ingrese el repositorio git a clonar [$REPO_URL]: " input
REPO_URL=${input:-"$REPO_URL"}

read -p "Ingrese el nombre de la rama de git [$BRANCH]: " input
BRANCH=${input:-"$BRANCH"}

ODOO_PATH_BASE="/opt/odoo/$PROJECT_NAME"
source /opt/odoo/venv/bin/activate
git clone $REPO_URL -b $BRANCH $ODOO_PATH_BASE
cd $ODOO_PATH_BASE
copier copy --trust --vcs-ref custom gh:celm1990/doodba-copier-template --overwrite  .
echo -e "\nIngrese las credenciales para loguearse en el registry de gitlab"
docker login registry.gitlab.com
docker-compose -f $ODOO_PATH_BASE/inverseproxy/traefik.yaml up -d
docker-compose -f $ODOO_PATH_BASE/prod.yaml pull odoo
docker-compose -f $ODOO_PATH_BASE/prod.yaml up -d