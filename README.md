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

### Parte 2: ¿Y cómo los agrego?
  - Estaría bueno que la interfaz permita agregar deudores, ¿no? Ok, yo lo hago por usted. Dejemos que yo me encargue del HTML y usted del Javascript: de esta forma, seremos un equipo. Por favor, ejecute este comando: `git merge origin/parte2`.
  - Sí, sí, también saqué las columnas *Nombre* y *Apellido* para no ser redundante (ya que ya mostramos el nombre completo), eso no es importante.
  - El formulario para agregar deudores funciona de la siguiente forma:
    - Al escribir en los textboxes, modificará las propiedades `nombre`, `apellido` y `saldo` del `scope` con lo que ingresó el usuario (siempre como string).
    - Al presionar el botón de agregar, invocará a la función `agregarDeudor()` del `scope` (que todavía no existe).
  - Modificar el constructor de `Deudor` para que admita el saldo. Este, obviamente, al provenir del input del usuario vendrá como *string*, por lo que será necesario ~~convertirlo a número~~ *parsearlo*.
  - Agregar una función `agregarDeudor` al objeto `scope` que instancie un Deudor con los datos ingresados, y lo agregue al array. ¡Ya funca!
  - Crear un método `debe` en el `Deudor` que retorne `true` si su saldo es negativo. Los que tienen saldo negativo serán mostrados en rojo en la lista.
  - Realice un *commit* en el repositorio con los cambios realizados.

### Parte 3: Esto es un quilombo de orden superior.
  - Está todo muy desordenado. Modificar el programa para que cada vez que se agregue un deudor, la lista se ordene de forma **decreciente** por `saldo`.
  - Ahora quiero que muestre la deuda total **de los que deben** (es decir, sin contemplar las filas en verde). Ejemplo:
    - Juan tiene saldo **23**
    - Carlos tiene saldo **-4**
    - Pedro tiene saldo **-3**
    - => La deuda total es **7**
    - ===> Para esto:
      - Hacer `git merge origin/parte3` para actualizar la UI.
      - Meter una función en el `scope` llamada `deudaTotal` que la calcule. Ayudarse de las funciones `filter` (de js) y `sum` (suma un array de números, por ejemplo `[1, 2, 3].sum()` devuelve **6**).
      - Verificar que funcione.
  - Commitear.

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
