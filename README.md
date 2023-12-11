# FocusNewsBot
Avviare e impostare correttamente il bot:

- Aprire XAMPP e avviare sia "Apache Web Server" che "MySQL Database"

- Tramire la pagina phpMyAdmin creare il database "DBFocusNews"
(Creare un nuovo database e chiamarlo "DBFocusNews")
  
- Importare la tabella "News" tramite il file News.sql nella sezione "importa" di phpMyAdmin
(in caso di problemi relativi all'inserimento della tabella usare il WebCrawler allegato nella repository)

- Aprire IntelliJ e importare il progetto "TelegramBot-DallaValeria"

- Scaricare tutte le librerie necessarie per far funzionare il bot
(Scaricare le librerie "mysql.connector.j:8.2.0" e "slf4j.nop:2.0.9" da Maven e
aggiungere la libreria TelegramBots.jar allegata nella repository da Java)

- Avviare il bot dal file Main.java del progetto

- Cercare "DallaValeria5CII" o @LDVFocusNewsBot su Telegram
