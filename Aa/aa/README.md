# 2024-1-grupo-20
https://two024-1-grupo-20.onrender.com

Como hacer funcionar la pagina: 

Primero debemos clonar el repositorio en nuestro computador y luego abrir estos desde tu editor de texto, como puede ser vs code. Se requieren los siguientes prerrequisitos para que sea funcional el código, primero se necesita ruby 3.1.0, Rails 7.0.8.1 y PostgreSQL. Luego debes ir al archivo database.yml, que lo encuentras en config/database.yml e ingresar tus datos de postgres sql. Una vez completados estos prerrequisitos instalamos las gemas que se usan en el código. Para esto abrimos la terminal, nos dirigimos a los archivos donde estamos trabajando, y escribimos el siguiente comando en la terminal “bundle install”. El siguiente paso en configurar nuestra base de datos, para esto se realizan dos comandos, en primer lugar, “rails db:create” y luego “rails db:migrate”.  Ahora para usar la página, iniciamos el servidor con el comando “rails s”, abrimos nuestro navegador, de preferencia google chrome, y navegamos a “http://localhost:3000”. 

 

La plataforma:  

MatchFinder es una plataforma para crear, unirse y participar en eventos deportivos, es una novedosa forma de convocar gente para diferentes partidos. Al entrar a MAtchFInder, uno debe crear una cuenta, o solo ingresar si ya tienes una; una vez dentro tienes la opción de ver los eventos disponibles, crear eventos nuevos, mirar los perfiles existentes, editar el propio perfil y cerrar sesión. 

 

 Página principal: 
La página principal muestra un texto dando la bienvenida a la aplicación, muestra la lista de eventos publicados, para así tener una noción de cómo funciona una vez ingresado. En la parte superior se muestra la opción de iniciar sesión y registrarse: 

Sign up: corresponde a registrarse, aqui deberas poner una contraseña segura, repetir la contraseña, colocar un email y nombre de usuario 

Sign in: corresponde a iniciar sesión, donde debes poner tu email y contraseña y hay una opción por si olvidaste tu contraseña, donde colocar tu correo y te mandan instrucciones. 

 

Dentro de la pagina: 

Una vez dentro, después de iniciar sesión o registrarse, tienes distintas opciones: 

Eventos: corresponde a una lista de los eventos existentes, separada en los eventos futuros y eventos pasados. A simple vista se muestra el deporte, fecha, hora, lugar, cantidad de participantes y varias opciones que puedes seleccionar: puedes “mostrar” evento para ver información específica, puedes “unirte” si hay cupos, puedes “editar” el evento si eres el creador, puedes “eliminar” el evento si eres el creador, puedes “cancelar” participación si es que ya estas dentro. También puedes seleccionar “chat” que te llevara a un chat donde puedes conversar con el resto de los usuarios. Se pueden filtrar los eventos por el deporte que te interesa. 

 

Crear evento:  puedes crear tu propio evento, donde debes seleccionar el deporte, lugar, fecha, hora y cupos. Una vez seleccionadas todas estas especificaciones, tu evento se añadirá a la lista de eventos y otros usuarios podrán unirse. 

Perfiles existentes: en los perfiles existentes puedes mirar la lista de perfiles existentes en la plataforma y hay un buscador por si deseas ver a alguien en específico. 

Edit profile: Aquí puedes cambiar n nombre de usuario, mail, contraseña, foto de perfil e, incluso, borrar la cuenta. 

Sign out: al apretar sign out, de manera automática cierra tu sesión y te lleva a la página principal donde estas nuevamente como invitado. 