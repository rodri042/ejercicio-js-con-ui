# ejercicio-js-con-ui

## Ejercicio
  El ejercicio se desarrolla con los archivos del directorio **client/app/main**.

  ### Parte 1: Jugando
  - Instalar todo (seguir las partes de **Setup del entorno** y **Setup de la aplicación**).
  - Correr la app y verificar que se vea una lista incompleta de deudores.
  - Modifique `main.controller.js` para agregar a *pedro picapiedra* a la lista de deudores, y corrobore que la interfaz muestra el cambio correctamente.
  - Modifique el constructor de `Deudor` para que en la instanciación del mismo, el nombre y el apellido queden capitalizados (con su primer letra en mayúsculas). Puede usar la función `_.capitalize(string)`, incluída en el proyecto.
  - Agregue un método al prototipo de `Deudor` llamado `nombreCompleto` que retorne el nombre y el apellido separados por un espacio. Verifique que se muestre en la interfaz.
  - Ya que todo funciona, realice un *commit* en el repositorio en donde el mensaje sea el resumen de los cambios realizados:

  ```bash
  git add -A .
  git commit -m "Mensaje con resumen de los cambios realizados"
  ```

  ### Parte 2: ¿Y el saldo?
  - Ahora que tienen nombre completo, podemos borrar las columnas *Nombre* y *Apellido*, para no dar información redundante. Yo lo hago por usted. Dejemos que yo me encargue del HTML y usted del Javascript. De esta forma, seremos un equipo. Por favor, ejecute este comando: `git merge parte2`.

## Setup del entorno

```bash
# instalar nodejs y npm
sudo yum install nodejs
curl http://npmjs.org/install.sh | sh

# instalar grunt-cli y bower globalmente
npm install -g grunt-cli
npm install -g bower
```

## Setup de la aplicación

```bash
# clonar el repositorio
git clone https://github.com/rodri042/ejercicio-js-con-ui

# pararse en el directorio del proyecto
cd ejercicio-js-con-ui

# instalar dependencias de terceros (bibliotecas y frameworks)
npm install
bower install

# abrir el proyecto con Sublime Text
subl ejercicio-js-con-ui.sublime-project

# ejecutar el servidor
grunt
# (esto escucha en http://localhost:9001)
```
