import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import javax.swing.*;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class LDV_Bot extends TelegramLongPollingBot {
    static java.sql.Connection conn1 = null;
    public String getBotUsername() {
        return "DallaValeria5CII";
    }
    @Override
    public String getBotToken() {
        //token
        return "6978448224:AAE4s_bOom_84Ir2BkCUuzsOR1-MJZTtAwE";
    }
    public void onUpdateReceived(Update update) {
        //ad ogni aggiornamento del bot (messaggio)
        if (update.hasMessage() && update.getMessage().hasText()) {
            String messageText = update.getMessage().getText().trim();
            String chatId = update.getMessage().getChatId().toString();

            if (messageText.startsWith("/")) {
                switch (messageText) {
                    case "/start":
                        sendStartMessage(chatId);
                        break;
                    case "/commands":
                        sendCommandsMessage(chatId);
                        break;
                    case "/allnews":
                        sendAllNewsMessage(chatId);
                        break;
                    case "/sciencenews":
                        sendScienceNewsMessage(chatId);
                        break;
                    case "/environmentnews":
                        sendEnvironmentNewsMessage(chatId);
                        break;
                    case "/culturenews":
                        sendCultureNewsMessage(chatId);
                        break;
                    case "/behaviournews":
                        sendBehaviourNewsMessage(chatId);
                        break;
                    case "/technologynews":
                        sendTechnologyNewsMessage(chatId);
                        break;
                    default:
                        sendUnknownCommandMessage(chatId);
                        break;
                }
            } else {
                sendUnknownCommandMessage(chatId);
            }
        }
    }

    private void sendStartMessage(String chatId) {
        String startMessage = "🌟 Welcome to the Focus News Bot! 🌟\n" +
                "🌐 Stay updated with the latest and most intriguing stories curated from the online pages of Focus magazine. " +
                "From science and technology to culture, environment and behaviour, we've got your daily dose of knowledge covered. " +
                "Type /commands to obtain the list of the commands to begin your journey into the world of fascinating news! 🚀";

        SendMessage startSendMessage = new SendMessage();
        startSendMessage.setChatId(chatId);
        startSendMessage.setText(startMessage);

        try {
            execute(startSendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void sendUnknownCommandMessage(String chatId) {
        String unknownCommandMessage = "❌ Unknown command! ❌\n" +
                "The commands must necessarily begin with a '/'\n" +
                "To view the complete list of commands write /commands";

        SendMessage unknownCommandSendMessage = new SendMessage();
        unknownCommandSendMessage.setChatId(chatId);
        unknownCommandSendMessage.setText(unknownCommandMessage);

        try {
            execute(unknownCommandSendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void sendCommandsMessage(String chatId){
        String commands = "⬇\uFE0F Available commands for the bot: ⬇\uFE0F \n"
                + "/start --> View start message\n"
                + "/commands --> View the list of all available commands\n"
                + "/allnews --> View a list of all the available news\n"
                + "/sciencenews --> View all the science topic news\n"
                + "/environmentnews --> View all the environment topic news\n"
                + "/culturenews --> View all the culture topic news\n"
                + "/behaviournews --> View all the behaviour topic news\n"
                + "/technologynews --> View all the technology topic news";

        SendMessage sendCommandsMessage = new SendMessage();
        sendCommandsMessage.setChatId(chatId);
        sendCommandsMessage.setText(commands);

        try {
            execute(sendCommandsMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void sendAllNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere tutte le notizie
            String query = "SELECT Topic, Title, Description, Link FROM News";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83D\uDCAF ALL RECENT NEWS \uD83D\uDCAF\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void sendScienceNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere le notizie 'scienza'
            String query = "SELECT Topic, Title, Description, Link FROM News WHERE Topic = 'Scienza'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83D\uDD2C SCIENCE NEWS \uD83D\uDD2C\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void sendEnvironmentNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere le notizie 'ambiente'
            String query = "SELECT Topic, Title, Description, Link FROM News WHERE Topic = 'Ambiente'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83E\uDEB4 ENVIRONMENT NEWS \uD83E\uDEB4\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void sendCultureNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere le notizie 'cultura'
            String query = "SELECT Topic, Title, Description, Link FROM News WHERE Topic = 'Cultura'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83D\uDCAE CULTURE NEWS \uD83D\uDCAE\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void sendBehaviourNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere le notizie 'comportamento'
            String query = "SELECT Topic, Title, Description, Link FROM News WHERE Topic = 'Comportamento'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83D\uDC65 BEHAVIOUR NEWS \uD83D\uDC65\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void sendTechnologyNewsMessage(String chatId) {
        try {
            //connessione al database
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

            //query per prendere le notizie 'tecnologia'
            String query = "SELECT Topic, Title, Description, Link FROM News WHERE Topic = 'Tecnologia'";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                //messaggio introduttivo
                StringBuilder messageText = new StringBuilder("\uD83D\uDDA5\uFE0F TECHNOLOGY NEWS \uD83D\uDDA5\uFE0F\n\n");

                //itera e aggiunge le informazioni e costruisce la formattazione del messaggio
                while (resultSet.next()) {
                    String topic = resultSet.getString("Topic");
                    String title = resultSet.getString("Title");
                    String description = resultSet.getString("Description");
                    String link = resultSet.getString("Link");

                    messageText.append("Topic - ").append(topic).append("\n")
                            .append("Title - ").append(title).append("\n")
                            .append("Description - ").append(description).append("\n")
                            .append("Link - ").append(link).append("\n\n");
                }

                //chiude la connessione al database
                connection.close();

                //divide il messaggio in parti più piccole
                String[] messageParts = messageText.toString().split("(?<=\n\n)");

                //invia ogni parte del messaggio
                for (String part : messageParts) {
                    SendMessage message = new SendMessage();
                    message.setChatId(chatId);
                    message.setText(part);

                    execute(message);
                }

            } catch (SQLException | TelegramApiException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}