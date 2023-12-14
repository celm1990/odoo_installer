#!/bin/bash
# Función para validar la respuesta del usuario
validate_response() {
    case "$1" in
        [y]|[yes])
            echo "yes"
            ;;
        [n]|[no])
            echo "no"
            ;;
        *)
            echo "invalid"
            ;;
    esac
}
while true; do
    read -p "Desea Instalar Docker?(Yes/No): " user_response
    user_response=$(echo "$user_response" | tr '[:upper:]' '[:lower:]') # Convertir la respuesta a minúsculas
    install_docker=$(validate_response "$user_response")
    if [ "$install_docker" = "invalid" ]; then
        echo "Respuesta invalida, responda (Yes/No)"
    else
        break
    fi
done
while true; do
    read -p "Desea Crear un usuario para odoo?(Yes/No): " user_response
    user_response=$(echo "$user_response" | tr '[:upper:]' '[:lower:]') # Convertir la respuesta a minúsculas
    create_user_odoo=$(validate_response "$user_response")
    if [ "$create_user_odoo" = "invalid" ]; then
        echo "Respuesta invalida, responda (Yes/No)"
    else
        break
    fi
done
if [ "$install_docker" = "yes" ]; then
    sudo ./scripts/01_docker_install.sh
fi
if [ "$create_user_odoo" = "yes" ]; then
    sudo adduser --system --home /opt/odoo --shell /bin/bash --gecos "Odoo" --group odoo
fi
#--------------------------------------------------
# Install Dependencies
#--------------------------------------------------
echo -e "\n--- Installing Python 3 + pip3 --"
sudo apt-get install git python3-pip build-essential wget python3-setuptools -y
sudo -H pip3 install virtualenv
sudo cp -r ../odoo_installer /opt/odoo/odoo_installer
sudo chown odoo: -R /opt/odoo/odoo_installer
echo -e "\n--- Ingrese al usuario odoo y ejecute el archivo ./install.sh --"
echo -e "\n sudo su - odoo"
echo -e "\n cd /opt/odoo/odoo_installer"
echo -e "\n ./install.sh"
# asegurarnos que el usuario odoo tenga permisos para ejecutar docker
sudo groupadd -f docker
sudo usermod -aG docker odoo
