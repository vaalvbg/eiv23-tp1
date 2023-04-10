# Electrónica IV. Trabajo práctico 1. Algoritmos en ensamblador Cortex-M3

Antes de comenzar:

- Por favor **lee este documento completo al menos una vez antes de comenzar a trabajar**. El trabajo es en equipo, así que es recomendable que se haga una lectura conjunta con todo el equipo.
- Si tienes traducción automática activada en tu navegador, los términos en inglés se traducirán de forma literal y podría dificultar el hacer algunas tareas. En particular el término *fork* (bifurcación) se traduce en algunos casos como *tenedor* (otra acepción de fork). *Es recomendable desactivar la traduccion automática*.

Una vez realizado este práctico conseguiras:

- Instalar el editor Visual Studio Code y el complemento PlatformIO.
- Instalar Git para Windows.
- Crear una cuenta en GitHub.
- Hacer un fork del repositorio de este práctico.
- Clonar el fork a la máquina local para trabajar.
- Implementar los algoritmos especificados mediante subrutinas en lenguaje ensamblador de máquina Cortex-M3.
- Ejecutar pruebas de software para verificar las rutinas implementadas.
- Entregar el práctico.

## Visual Studio Code y PlatformIO

Visual Studio Code (VSCode) es un editor de texto para programación y entorno de desarrollo integrado con un rico conjunto de módulos adicionales (plugins) que expanden su funcionalidad.

PlatformIO es un sistema automatizado de gestión de proyectos para programación de sistemas embebidos. Instala y actualiza automáticamente las herramientas y librerías requeridas por cada plataforma soportada. Automatiza los procesos de compilación, programación y depuración. Y cuenta con integración con VSCode.

### Instalación de Visual Studio Code

Si no tienes instalado VSCode, para instalarlo debes seguir las siguientes instrucciones:

- Navega al sitio [code.visualstudio.com][www_vscode], elige la opción de descarga (o download). Guarda el instalador en tu máquina.
- Ejecuta el instalador que descargaste. En windows es posible que muestre una advertencia indicando que el instalador solo puede instalar para el usuario actual y no para todos los usuarios, debes aceptarlo.
- Acepta el contrato de licencia y continúa con las opciones por defecto.
- Presiona instalar (install).
- Una vez instalado asegúrate que está marcada la casilla ejecutar VSCode y presiona finalizar.

En este punto ya has instalado VSCode para el usuario actual e iniciado el programa.

### Instalación de PlatformIO

En VSCode abre el menú de extensiones presionando `Ctrl+Mayusc+X` y escribe en la caja de búsqueda de dicho cuadro `platformio-ide`, luego presiona `Instalar` en el resultado `PlatformIO IDE`. La instalación puede demorar un tiempo y no presenta una barra de progreso, pero si se abrirá una consola que mostrará el proceso de instalación y mensajes emergentes. No cerrar la consola hasta que indique que ha finalizado. Al finalizar la instalación indicará que debemos reiniciar VSCode. Podemos entonces cerrar el programa.

## El sistema de control de versiones Git

[Git][www_git] es un sistema de control de versiones distribuido, creado originalmente por el equipo del kernel de Linux para su uso en dicho proyecto. Un sistema de control de versiones es un programa que permite seguir los cambios que ocurren en nuestro proyecto, recordando cada cambio que indiquemos en forma cronológica. Esos cambios se almacenan en una base de datos de cambios llamada *repositorio*.

El sistema git es distribuido, lo que significa que pueden crearse múltiples copias o clones de un repositorio. Cada repositorio clon puede tener asociada una copia de trabajo, que normalmente contendrá la última versión de los archivos de nuestro proyecto. Estas copias pueden editarse independientemente y sus cambios guardarse en los respectivos repositorios para luego sincronizar estos repositorios de modo que todas las copias vuevan a estar en el mismo estado, integrando los cambios de las otras copias. Esta operación se conoce como combinación o *merge*.

Usaremos git para guardar nuestro trabajo en los prácticos de la materia y mantendremos repositorios en línea en el servicio GitHub, que servirán como punto común para sincronizar cambios entre compañeros de grupo a la vez que como respaldo (incluyendo también todas las versiones históricas, no solo la actual).

### Instalación de Git

En VSCode presiona Ctrl+Mayusc+G para abrir el panel de control de versiones. Si no tienes instalado Git aparecerá un botón para descargar git. Presionándolo y aceptando abrir el sitio en el diálogo que aparece luego llegarás a la página de descarga de instalador de git para tu plataforma. Usa el primer link de descarga para descargar la versión recomendada del instalador y ejecútalo. Pulsa siguiente hasta llegar a la edición del editor de texto por defecto (*Choosing the default editor used by Git*). Allí selecciona usar Visual Studio Code. Luego continúa con las opciones por defecto hasta iniciar la instalación.

Una vez finalizada la instalación cierra VSCode y vuelve a abrirlo. Presiona Ctrl+Ñ para abrir la consola y configura tu nombre de usuario y mail en git usando los siguientes comandos (**reemplaza "Nombre y Apellido" por tu nombre y apellido entre comillas, y correo@gmail.com por tu dirección de correo electrónico**)

```{poweshell}
git config --global --add user.name "Nombre y Apellido"

git config --global --add user.email correo@gmail.com

```

Nota: Luego de escribir cada línea de comando debes presionar Enter para ejecutarla.

Una vez terminada la configuración cierra la consola ejecutando el comando `exit`. Luego puedes cerrar VSCode.

## GitHub

Github es un servicio que permite, entre otras cosas, alojar repositorios git en línea. Estos repositorios en línea pueden usarse para mantener la versión "oficial" del trabajo de un equipo, teniendo cada miembro una copia en su computadora y sincronizando con la versión en la nube para compartir con el resto del equipo sus cambios y obtener los cambios de los demás miembros. VSCode tiene integración con GitHub incorporada por defecto, facilitando trabajar con ese servicio para alojar los repositorios git remotos.

### Crea una cuenta

Si no tienes una cuenta en GitHub puedes crearla de forma gratuita navegando a [github.com][www_github]. En la página vé al enlace *sing up*, ingresa tu mail, crea una contraseña (y guarda una copia en lugar seguro), ingresa un nombre de usuario, responde si quieres recibir información por mail ("y" para sí o "n" para nó) y resuelve el captcha y presiona *crear cuenta*. Te llegará un código por mail que deberás ingresar en el sitio para confirmar tu mail y completar el proceso de creación. A continuación hay una serie de preguntas sobre el uso que le darás a github, para servir de orientación. Indica que eres estudiante. Luego te pide que indiques si piensas usar alguna característica en particular (puedes dejarlo en blanco). Finalmente te permite optar entre el servicio gratuito (es suficiente para nosotros) o las características pagas. Una vez creada la cuenta quedas en tu página personal en GitHub que por ahora estará vacía.

### Hacer fork del repositorio remoto

La acción *fork* (bifurcación) en github permite crear un repositorio en tu cuenta clonando otro repositorio en GitHub. Si el otro repositorio es actualizado en el futuro podrás obtener los últimos cambios y combinarlos con tu propio trabajo si así lo deseas. Además puedes solicitar al equipo del repositorio original que acepte tus cambios, este mecanismo es la base de la participación en proyectos de código abierto.

Para continuar con este práctico, *uno de los miembros del equipo* deberá, en su cuenta de github, hacer un fork del repositorio de este práctico [fmirandabonomi/eiv23-tp1][eiv23-tp1]. Luego de realizar el fork, podrás dar acceso de escritura al repositorio a los demás miembros del equipo. Para ello abre tu repositorio (estará abierto luego de hacer el fork) y ve a la configuración del mismo (Settings, con el ícono de un engranaje). Ve a la configuración de colaboradores *Access->Collaborators* (va a solicitarte que vuelvas a identificarte), en *Manage Access* haz click en *Add people*. Busca con los nombres de usuario de tus compañeros y añádelos al repositorio. Les llegará una invitación que *deben aceptar*. Para aceptar la invitación, en su cuenta github deben ir a los mensajes (ícono de la campana en el extremo superior derecho), haz click en el mensaje de invitación y luego en *Accept invitation*. Una vez aceptada tendrán acceso de escritura al repositorio.

### Clonar tu repositorio del práctico en forma local para trabajar

Para comenzar a trabajar deberás crear una copia local en tu pc del repositorio que creaste en github. Para ello en VSCode presiona *Ctrl+Mayusc+P* para abrir la paleta de comandos, escribe *git:clone* y presiona enter. Elige *clone from github*. La extensión de github en VSCode solicitará acceso a tu cuenta de github. Presiona *Allow* (permitir), se abrirá una pestaña del navegador en tu cuenta de github (debes tener una sección abierta) y allí debes seleccionar *Authorize Visual Studio Code...*, el navegador te advertirá que el sitio intenta abrir Visual Studio Code, debes aceptar (*Open*). Irás a Visual Studio Code donde aparecerá un pedido de la extensión para navegar a una dirección de confirmación. Debes aceptar también con *Open*. Luego de completado el proceso ha quedado vinculado VSCode con tu cuenta de github y puedes proceder a clonar el repositorio. En el espacio de búsqueda escribe eiv23-tp1 y busca la versión de tu grupo (comienza con el nombre de la cuenta de github del responsable de clonar el repositorio, *cuenta*/eiv23-tp1). Elige una carpeta de trabajo (el repositorio se creará en una subcarpeta con el nombre *eiv23-tp1*).

## Implementación de algoritmos

Para completar este práctico deberás implementar algoritmos en lenguaje ensamblador del procesador Cortex-M3. Esta tarea te permitirá familiarizarte con el funcionamiento básico de un procesador RISC. Tu código será una parte pequeña de un programa mayor que lo ejecutará y comprobará sus resultados. El archivo `lib\practico\practico.S` contiene una plantilla que deberás completar con tu solución.

### Suma (suma)

Dados dos números enteros de 32 bits, en los registros R0 y R1, calcular la suma y retornarla en el registro R0.

![a,b -> a+b][fig_suma]

### Sumatoria (sumatoria)

Dado un arreglo de números de 32 bits en memoria, donde la cantidad de números es dada en el registro R0 y la posición en memoria del primer número es dada en el registro R1. Calcular la sumatoria del arreglo, usando un acumulador de 64 bits, y devolver el resultado de 64 bits en R1:R0 (parte más significativa en R1, parte menos significativa en R0).

![n,b -> A = b[0]+...+b[n]][fig_sumatoria]

### Posicion máximo (posicion_maximo)

Dado un arreglo de números de 32 bits en memoria, donde la cantidad de números es dada en el registro R0 y la posición en memoria del primer número es dada en el registro R1. Encontrar la posición del máximo número en el arreglo. Devolver dicha posición en el registro R0.

![n,b -> k : b[i] <= b[k] para todo i en {0,..,n-1}][fig_posmax]

Notas:

- Si hay más de un máximo, retornar la posición del primero.
- El primer número tiene posición 0, el segundo posición 1, etc.
- Tener en cuenta que los números son de 32 bits (usan 4 bytes de memoria) por lo que las posiciones *no coinciden con los offset en bytes*.

### Ordenar de menor a mayor en el lugar (ordenar_en_sitio_menor_a_mayor)

Dado un arreglo de números de 32 bits en memoria, donde la cantidad de números es dada en el registro R0 y la posición en memoria del primer número es dada en el registro R1. Ordenar el arreglo de menor a mayor en su sitio (intercambiando posiciones de los números hasta que esté ordenado).

![n,b -> void : luego de ejecutar subprograma, b[i] <= b[j] para todo i <= j con i,j en {0,...,n-1}][fig_ordenar]

## Uso de pruebas de software para verificar la solución

Este proyecto hace uso del emulador Renode, por lo tanto no necesitas tener el hardware para completarlo. El proyecto tiene un conjunto de pruebas para verificar el funcionamiento de las rutinas que debes escribir. Para ejecutar las pruebas, en Visual Studio Code, presiona Ctrl+Shift+P y escribe `platformio:test` luego enter. Puede demorar un tiempo en ejecutarse la simulación. Hay en total 16 casos de prueba, definidos en `test/test_algoritmos/test_main.c. Se prueban tres casos para la suma, seis casos para la sumatoria, dos casos para posición del máximo y dos casos para ordenación.  

Recuerda: Si no pasan las pruebas, tu solución no es válida. Si pasan puede ser válida o nó, habra que revisarla en detalle. Pero si la diseñaste cuidadosamente y pasa las pruebas lo más probable es que sea válida.

## Depuración

Puedes depurar el proyecto usando Renode, para ello posiciónate en la línea de tu código que te interesa y haz click a la izquierda del número de linea para establecer un breakpoint. Después presiona F5 para depurar. Aparecerá la terminal de Renode y otra ventana con la salida de la usart1 (por donde salen los resultados de las pruebas). Después de unos momentos iniciará el cliente del depurador, el que podrás ver en la ventana de VSCode. El depurador quedará detenido al inicio del programa. Presiona F5 para continuar hasta tu punto de interrupción y luego F11 para avanzar un paso o F10 para avanzar un paso saltando llamadas a procedimiento. Si deseas ver más de una prueba puedes continuar con F5 hasta el siguiente punto de interrupción.

Nota: La emulación es limitada, el debugger no tiene acceso a los periféricos emulados (pero sí a la memoria y los registros del procesador). Además la emulación de los periféricos no pretende ser perfecta.

## Referencia en línea plataforma ARM Cortex-M3

Una buena referencia de la plataforma Cortex-M3 y su conjunto de instrucciones se encuentra en [Cortex-M3 Devices Generic User Guide][www_m3gug]. Esa referencia incluye una tabla resumida del conjunto de instrucciones [tabla de instrucciones][www_m3gug_iset], con links a secciones más detalladas. Además tiene una [referencia rápida de los registros][www_m3gug_regs] y [condiciones][www_m3gug_cond] (que usarás para los saltos condicionales).

[www_vscode]: https://code.visualstudio.com
[www_git]: https://git-scm.com/
[www_github]: https://github.com/
[www_m3gug]: https://developer.arm.com/documentation/dui0552/a?lang=en
[www_m3gug_iset]: https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-instruction-set/instruction-set-summary?lang=en
[www_m3gug_regs]: https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-processor/programmers-model/core-registers?lang=en
[www_m3gug_cond]: https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-instruction-set/about-the-instruction-descriptions/conditional-execution?lang=en
[eiv23-tp1]: https://github.com/fmirandabonomi/eiv23-tp1
[fig_suma]: suma.png
[fig_sumatoria]: sumatoria.png
[fig_posmax]: posicion_maximo.png
[fig_ordenar]: ordenar_en_sitio_menor_a_mayor.png
