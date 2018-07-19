# langdock

langdock es un manejador de versiones de múltiples lenguajes, que utiliza como principal
tecnología [Docker](https://github.com/docker), haciendo uso de
[Dockerhub](https://hub.docker.com)

langdock fue inspirado y sigue el modelo de [rbenv](https://github.com/rbenv/rbenv),
[goenv](https://github.com/syndbg/goenv) y [pyenv](https://github.com/pyenv/pyenv)

## Contenidos

* [Instalación](#instalación)
  * [Local](#local)
* [Uso](#uso)
* [Agregar repositorios](#agregar-repositorios-propios)
* [Variables de ambiente](#variables-de-ambiente)
* [Instalar una versión de un lengauge](#instalar-una-versión-de-lang)
  * [Manual](#manual)
  * [Usando archivo .<language>-version](#usando-archivo-.language-version)

## Instalación

### Local

1. Clonar el repositorio en ~/.langdock
```bash
$ git clone git@github.com:lucasdc6/langdock.git ~/.langdock
```

2. Agregar la variable de ambiente y el  directorio ~/.langdock/bin 
para contar con todos los ejecutables
```bash
$ echo 'export LANGDOCKPATH=$HOME/.langdock' >> ~/.bash_profile
$ echo 'export PATH="$HOME/.langdock/bin:$PATH"' >> ~/.bash_profile
```

3. Agregar la sentencia eval al bashrc
```bash
$ echo 'eval "$(langdock init -)' >> ~/.bash_profile
```
En Ubuntu modificar ~/.bashrc

En Zsh modificar ~/.zshrc

4. Reiniciar la terminar para efectuar los cambios.


## Uso

Funcionalidades actuales:
  * Setear versión global
  * Setear versión local
  * Instalar una versión (docker pull de los repositorios dados)
  * Listar versiones instaladas
  * Listar opciones disponibles para bajar de los repositorios

Además se cuenta con 3 opciones para el manejo de los repositorios docker:
  * Listar repositorios
  * Agregar repositorio
  * Eliminar repositorio

Para el manejo de los repositorios, se cuenta con un archivo de configuración
disponible en el directorio `etc/<nombre del lengauge>`, llamado _repositories._

En este archivo se cuenta con una lista de repositorios separados por saltos
de líneas.

Se recomieda no editar este archivo a mano.

## Agregar repositorios propios

```bash
  $ langdock repositories --add <NOMBRE DEL REPOSITORIO>
```

Por ejemplo, para agregar el repositorio oficial de php, solo hace falta

ejecutar:

```bash
  $ phpdock repositories --add php
```

## Variables de ambiente

Este script **NO** instala ningún binario el sistema, sino
que simplemente baja la imagen docker del repositorio especificado.

Variable | Descripción
---------|------------
`LANGDOCK_DEBUG` | Muestra información de debug
`LANGDOCKPATH` | Dirección raíz del programa langdock

## Archivos de versiones

### Versión global

- Archivo modificado por el comando `langdock global <version>`
- Guardado en `$LANGDOCKPATH/etc/<lenguaje>/version`
- Baja precedencia.

### Versión local

- Archivo modificado por el comando `langdock local <version>`
- Guardado en el contexto de ejecución del comando
- Media precedencia.

### Versión de la shell (En desarrollo!)

- Manejado mediante variables de ambiente por el comando `langdock shell <version>`
-Alta precedencia.

## Instalar una versión de php

Si bien langdock no instala versiones de php, sino que clona imágenes docker y
las acondiciona de manera que sea transparente su uso para el programador, vamos
a referirnos a la acción de clonar dichas imágenes como instalación.

Existen 2 maneras de instalar una nueva versión:

### Manual

La manera manual de instalar una nueva versión es la siguiente:

1. Primero se debe conocer el repositorio y la versión (tag de docker) de la
   imagen a instalar.

   Para esto se puede consultar el comando "install" con la opción "--list":

   ```bash
    langdock install --list
    # lista de versiones
    ```
2. Una vez reconocido el nombre y versión de la imagen, se debe simplemente
   especificarlo de la siguiente manera:
   Por ejemplo, vamos a instalar la versión 7.1.9 del repositorio docker oficial
   de php.

   ```bash
    langdock install php:7.1.9
   ```

### Usando archivo .lenguaje-version

Si se conoce la versión del lengauje se se va a utilizar en el proyecto de antemano,
se puede crear un archivo llamado ".<lenguaje>-version", en el cual se especifique
dicha versión, para facilitar la búsqueda de la imagen docker ideal para su
proyecto.

Una vez creado el archivo, simplemente hace falta ejecutar el comando "install"
de langdock sin ningún argumento, de la siguiente manera:

   ```bash
    langdock install
   ```

Con esto, se desplazará un menú con todas las imágenes docker de los
repositorios que cumplan con dicha versión.
Una vez escrito el número y presionado enter, comenzara el proceso de pull de la
imagen docker.
