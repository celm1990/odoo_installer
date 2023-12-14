#!/bin/bash

virtualenv /opt/odoo/venv -p /usr/bin/python3
source /opt/odoo/venv/bin/activate
pip3 install copier==9.1.0 invoke pre-commit
echo -e "\n--- IMPORTANTE: active el entorno virtual con el comando:"
echo -e "source /opt/odoo/venv/bin/activate"
