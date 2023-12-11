import java.util.ArrayList;
import java.util.Scanner;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import java.io.IOException;
import java.sql.*;

public class Main {

    static java.sql.Connection DBFocusNews = null;

    public static void main(String[] args) throws SQLException {

        //connessione al database
        DBFocusNews = DriverManager.getConnection("jdbc:mysql://127.0.0.1/DBFocusNews", "root", "");

        //dichiarazione degli URL delle diverse sezioni/topic della pagina Focus e crawl di ciascuna per prendere le informazioni
        String urlSci = "https://www.focus.it/scienza";
        String urlAmb = "https://www.focus.it/ambiente";
        String urlCult = "https://www.focus.it/cultura";
        String urlComp = "https://www.focus.it/comportamento";
        String urlTec = "https://www.focus.it/tecnologia";
        crawl(urlSci);
        crawl(urlAmb);
        crawl(urlCult);
        crawl(urlComp);
        crawl(urlTec);
    }

    //metodo crawl della pagina
    public static void crawl(String url) {

        //in base all'URL determina la sezione
        boolean isScienza = url.contains("scienza");
        boolean isAmbiente = url.contains("ambiente");
        boolean isCultura = url.contains("cultura");
        boolean isComportamento = url.contains("comportamento");
        boolean isTecnologia = url.contains("tecnologia");

        try {
            //connessione alla pagina
            Connection connection = Jsoup.connect(url);
            Document document = connection.get();

            if (document != null) {
                //entra nello specifico div della pagina dell'articolo
                for (Element div : document.select("div.foc-card.foc-mBottom3x.-small.-vertical")) {

                    //estrae e determina il link della pagina dell'articolo
                    Element link = div.selectFirst("a[href]");
                    String Link = link.absUrl("href");
                    //esegue il pagecrawl per il titolo e per la descrizione dell'articolo
                    String Title = pagecrawl(Link);
                    String Description = pagecrawl2(Link);
                    System.out.println("Title: " + Title);
                    System.out.println("Link: " + Link);
                    System.out.println("Description: " + Description);

                    String Topic = "";
                    //determina il topic della pagina in base alla sezione
                    if (isScienza) {
                        Topic = "Scienza";
                    } else if (isAmbiente) {
                        Topic = "Ambiente";
                    } else if (isCultura){
                        Topic = "Cultura";
                    } else if (isComportamento){
                        Topic = "Comportamento";
                    } else if (isTecnologia){
                        Topic = "Tecnologia";
                    }
                    System.out.println("Topic: " + Topic);

                    try {
                        //inserisce tutte le informazioni nel database
                        String query = "INSERT INTO News (Topic, Title, Description, Link) VALUES (?, ?, ?, ?)";
                        PreparedStatement preparedStatement = DBFocusNews.prepareStatement(query);
                        preparedStatement.setString(1, Topic);
                        preparedStatement.setString(2, Title);
                        preparedStatement.setString(3, Description);
                        preparedStatement.setString(4, Link);
                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    //metodo crawl per il titolo dell'articolo
    public static String pagecrawl(String url) {
        try {
            //connessione alla pagina
            Connection connection = Jsoup.connect(url);
            Document document = connection.get();

            if (document != null) {
                //entra nello specifico div
                for (Element div : document.select("div.foc-title.foc-font-bold.foc-mBottom2x")) {
                    //trova ed estrae il titolo
                    for (Element titleElement : document.select("h1")) {
                        Element title = titleElement.selectFirst("h1");
                        return title.text();
                    }
                }
            }
        } catch (IOException e) {
            System.out.println("Errore!... " + e.getMessage());
        }
        return "";
    }

    //metodo crawl per la descrizione dell'articolo
    public static String pagecrawl2(String url) {
        try {
            //connessione alla pagina
            Connection connection = Jsoup.connect(url);
            Document document = connection.get();

            if (document != null) {
                //entra nell'h2
                for (Element h2 : document.select("h2.foc-abstract.foc-font-bold.foc-mBottom3x")) {
                    //estrae la descrizione
                    return h2.text();
                }
            }
        } catch (IOException e) {
            System.out.println("Errore!... " + e.getMessage());
        }
        return "";
    }
}