<!-- /!\ do not modify above this line -->

# Instalador de Odoo con docker y Doodba

Instalar Odoo usando docker y doodba desde un repositorio creado con [doodba-copier-template](https://github.com/celm1990/doodba-copier-template)

<!-- /!\ do not modify below this line -->

## REQUISITOS
- Ubuntu 22.04 LTS
- Git
- Docker
- Token de github para poder clonar repositorios privados
- Tener libre el puerto 80 para levantar Traefik
- Tener o crear un usuario llamado `odoo` con home en `/opt/odoo`

## INSTALACION

- Clone este repositorio: 
```bash
git clone https://github.com/celm1990/odoo_installer -b 17.0
```
- Ingrese a la carpeta `odoo_installer`: 
```bash
cd odoo_installer
```

- Ejecutar el archivo `pre-install.sh` para instalar las dependencias necesarias:
```bash
./pre-install.sh
```
- Ingrese al usuario `odoo`: 
```bash
sudo su - odoo
```
- Estando dentro del usuario odoo y en la ruta `/opt/odoo/odoo_installer`, ejecute el comando `./install.sh`

```bash
cd /opt/odoo/odoo_installer
```
```bash
./install.sh
```
- Responda todas las preguntas

## TIPS
- Despues de levantar la instancia, si se obtiene un `Internal Server Error` porque la BD se creo mal, borrarla ejecutando
```bash
docker-compose -f prod.yaml exec -i odoo click-odoo-dropdb NOMBRE_BD
```
- para cambiar algun parametro del copier, ejecutar(active primero virtualenv):
```bash
copier copy --trust --vcs-ref custom gh:celm1990/doodba-copier-template --overwrite  .
```