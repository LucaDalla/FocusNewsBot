-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 11, 2023 alle 10:12
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBFocusNews`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `News`
--

CREATE TABLE `News` (
  `Id` int(11) NOT NULL,
  `Topic` varchar(1000) NOT NULL,
  `Title` varchar(1000) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `News`
--

INSERT INTO `News` (`Id`, `Topic`, `Title`, `Description`, `Link`) VALUES
(1, 'Scienza', 'Gli appuntamenti: dal 5 dicembre a Roma il New Space Economy European Expoforum (NSE)', 'In questa pagina vi segnaliamo eventi, iniziative, appuntamenti e novità editoriali. Prendete nota.', 'https://www.focus.it/scienza/spazio/gli-appuntamenti-focus'),
(2, 'Scienza', 'Parkinson e nanoplastiche: potrebbe esserci un legame', 'Le nanoplastiche ormai onnipresenti facilitano aggregazioni di una proteina simili a quelle presenti nel cervello di chi è affetto da Parkinson.', 'https://www.focus.it/scienza/salute/parkinson-e-nanoplastiche-potrebbe-esserci-un-legame'),
(3, 'Scienza', 'Siamo in grado di salvare la Terra dall\'impatto con un asteroide (scoperto pochi giorni prima)?', 'Un razzo planetario lanciato verso un asteroide in rotta di collisione con il nostro Pianeta potrebbe (forse) salvarci. Ma prima dobbiamo costruirne uno.', 'https://www.focus.it/scienza/spazio/possiamo-difenderci-da-asteroide-scoperto-pochi-giorni-prima-di-impatto-terra'),
(4, 'Scienza', 'Chi è più a rischio di sviluppare dipendenza da cannabis? Lo svela una ricerca genetica', 'Uno studio di genetica ha permesso di trovare alcune regioni del DNA associate alla dipendenza cannabis ma anche a condizioni come la schizofrenia.', 'https://www.focus.it/scienza/salute/individuati-i-geni-legati-alla-dipendenza-da-cannabis'),
(5, 'Scienza', 'HIV: contrastare una proteina potrebbe regalare una migliore qualità di vita', 'Nella Giornata Mondiale contro l\'AIDS una ricerca che potrebbe ridurre le patologie concomitanti nelle persone con HIV, migliorandone la salute.', 'https://www.focus.it/scienza/salute/hiv-contrastare-una-proteina-potrebbe-regalare-una-migliore-qualita-di-vita'),
(6, 'Scienza', 'La missione Cheops dell\'Esa risolve un mistero e scopre un sistema di 6 esopianeti', 'Scoperto un raro sistema con sei esopianeti: la configurazione delle orbite dimostra che il sistema è rimasto inalterato dalla formazione avventuta un miliardo di anni fa.', 'https://www.focus.it/scienza/spazio/la-missione-cheops-dell-esa-risolve-un-mistero-e-scopre-un-sistema-di-6-esopianeti'),
(7, 'Scienza', 'Sclerosi multipla: caute speranze dalle cellule staminali', 'L\'iniezione di cellule staminali nel cervello di (pochi) pazienti è parsa ben tollerata. E può forse ridurre l\'avanzare della sclerosi multipla.', 'https://www.focus.it/scienza/salute/sclerosi-multipla-caute-speranze-dalle-cellule-staminali'),
(8, 'Scienza', 'Ecco il buco nero più distante dalla Terra: è a 13,2 miliardi di anni luce', 'Grazie ai dati del telecopio James Webb e di quello a raggi X Chandra, è stato scoperto il buco nero più antico mai visto che si formò appena 470 milioni di anni dopo il Bing Bang.', 'https://www.focus.it/scienza/spazio/scoperto-il-piu-distante-da-noi-buco-nero-dell-universo'),
(9, 'Scienza', 'Crohn e rettocolite ulcerosa visibili nel sangue anni prima della diagnosi?', 'Le malattie infiammatorie croniche intestinali come quella di Crohn forse rintracciabili nei valori sanguigni diversi anni prima dei sintomi seri.', 'https://www.focus.it/scienza/salute/crohn-e-rettocolite-ulcerosa-visibili-nel-sangue-anni-prima-della-diagnosi'),
(10, 'Scienza', 'Buco dell\'ozono: e se non si stesse rimarginando affatto?', 'Negli ultimi 4 anni, il buco nell\'ozono sembra essersi espanso: uno studio - contestato - ipotizza che la sua \"guarigione\" non sia affatto scontata.', 'https://www.focus.it/scienza/scienze/buco-ozono-se-non-si-stesse-rimarginando-affatto'),
(11, 'Ambiente', 'L’iceberg più grosso del mondo ha ricominciato a muoversi: dobbiamo preoccuparci?', 'A23a, l\'iceberg più grosso del Pianeta, rimasto incastrato sul fondale del mare di Weddell da 37 anni, ha cominciato a navigare nelle acque dell\'Antartico. Non sappiamo ancora dove, come e quando terminerà il suo percorso.', 'https://www.focus.it/ambiente/ecologia/l-iceberg-piu-grosso-del-mondo-ha-ricominciato-a-muoversi'),
(12, 'Ambiente', 'L’animale più grande di tutti i tempi è il Perucetus colossus: un enorme cetaceo', 'Individuati in Perù i fossili del Perucetus colossus l\'animale più grande e pesante vissuto finora: un mega cetaceo dal peso record di 340 tonnellate.', 'https://www.focus.it/ambiente/animali/animale-piu-grande-di-tutti-i-tempi-perucetus-colossus-cetaceo-mastodontico'),
(13, 'Ambiente', 'La medicina per allungare la vita ai cani grossi: funzionerà?', 'I cani di grossa taglia vivono meno di quelli piccoli: una compagnia statunitense sostiene di avere un modo per invertire questa tendenza.', 'https://www.focus.it/ambiente/animali/la-medicina-per-allungare-la-vita-ai-cani-grossi'),
(14, 'Ambiente', 'Entro 50 anni il Mediterraneo diventerà troppo caldo (anche) per il tonno', 'Nei prossimi decenni, il tonno rosso abbandonerà le nostre acque a causa delle temperature insopportabili. E sposterà le sue nursery in acque più fredde.', 'https://www.focus.it/ambiente/animali/il-mediterraneo-diventera-troppo-caldo-per-il-tonno'),
(15, 'Ambiente', 'L\'Etna torna a dare spettacolo con una nuova eruzione', 'L\'Etna è interessato da una serie di episodi stromboliani, con fontane di lava che fuoriescono dal cratere di Sud-Est.', 'https://www.focus.it/ambiente/natura/l-etna-torna-a-dare-spettacolo-con-una-nuova-eruzione'),
(16, 'Ambiente', 'Le più antiche impronte di uccelli hanno 120 milioni di anni', 'In Australia sono state ritrovate impronte fossili di uccelli che risalgono al primo Cretaceo, quando il continente faceva ancora parte della Gondwana.', 'https://www.focus.it/ambiente/animali/le-piu-antiche-impronte-di-uccelli-hanno-120-milioni-di-anni'),
(17, 'Ambiente', 'I tursiopi hanno imparato a rubare le esche ai pescatori', 'I tursiopi di Koombana Bay, in Australia, hanno capito come rubare le esche dalle trappole per i granchi dei pescatori. E si divertono anche a farlo.', 'https://www.focus.it/ambiente/animali/tursiopi-hanno-imparato-a-rubare-esche-ai-pescatori'),
(18, 'Ambiente', 'COP28: che cosa aspettarsi dalla conferenza sui cambiamenti climatici a Dubai', 'Dal 30 novembre al 12 dicembre si discuterà di emissioni e clima durante la COP28, quest\'anno ospitata dal principale esportatore di petrolio e gas.', 'https://www.focus.it/ambiente/ecologia/cop28-che-cosa-aspettarsi-dalla-conferenza-sui-cambiamenti-climatici-a-dubai'),
(19, 'Ambiente', 'Problemi di dimensioni: il pipistrello costretto a fare sesso senza penetrazione', 'Il serotino comune è un pipistrello dotato di un pene troppo grosso per il sesso penetrativo, una caratteristica che lo rende unico tra i mammiferi.', 'https://www.focus.it/ambiente/animali/pipistrello-che-fa-sesso-senza-penetrazione'),
(20, 'Ambiente', 'Il piano (un altro) per riportare in vita i mammut', 'Una compagnia di biotecnologie texana vuole de-estinguere il mammut lanoso, scomparso 4mila anni fa, e reintrodurre i primi esemplari in natura entro il 2028.', 'https://www.focus.it/ambiente/animali/piano-per-riportare-in-vita-mammut'),
(21, 'Cultura', 'Vuoi combattere l\'inquinamento in casa? Meglio lo straccio', 'L\'inquinamento che si deposita sulle superfici delle nostre case non è meno nocivo per la nostra salute di quello che penetra dall\'esterno attraverso porte e finestre. E usare purificatori d\'aria non è abbastanza.', 'https://www.focus.it/cultura/curiosita/inquinamento-in-casa-usa-lo-straccio'),
(22, 'Cultura', 'Perché si dice “dare a Cesare quel che è di Cesare”?', '\"Rendete a Cesare ciò che è di Cesare e a Dio ciò che è di Dio\". Secondo i Vangeli, questa espressione fu pronunciata per la prima volta da Gesù. Ecco in quale occasione.', 'https://www.focus.it/cultura/curiosita/perche-si-dice-dare-a-cesare-quel-che-e-di-cesare-'),
(23, 'Cultura', 'Seconda guerra mondiale: la vicenda del pilota americano identificato dopo ottant’anni', 'Un pilota americano, abbattuto durante la Seconda guerra mondiale, è stato identificato dopo ottant\'anni grazie a una complessa indagine forense.', 'https://www.focus.it/cultura/storia/seconda-guerra-mondiale-vicenda-pilota-americano-identificato-dopo-ottant-anni'),
(24, 'Cultura', 'Maria Callas: la diva infelice dalla voce unica che lasciò il segno nella musica lirica', 'Cent\'anni fa nasceva Maria Callas: dopo di lei la musica lirica non fu più la stessa. La storia della diva infelice che per una vita inseguì l\'amore come un\'eroina della tragedia greca.', 'https://www.focus.it/cultura/storia/maria-callas-divina-ma-infelice'),
(25, 'Cultura', 'La storia (tutta da ridere) delle barzellette e di chi le ha inventate', '\"C\'erano un greco, un romano e un fenicio...\". Fin dall\'antichità, l\'arte di raccontare barzellette si è diffusa in tutti gli strati sociali. Ecco come si è evoluta.', 'https://www.focus.it/cultura/storia/la-storia-tutta-da-ridere-delle-barzellette'),
(26, 'Cultura', 'Qui si cela una piramide di 27.000 anni fa? Sarebbe la più antica mai scoperta (e non in Egitto)', 'Sotto il sito preistorico di Gunung Padang, in Indonesia, potrebbe essere nascosta la piramide più antica del mondo. Ma sono necessarie ulteriori ricerche.', 'https://www.focus.it/cultura/storia/piramide-di-27-000-anni-sarebbe-la-piu-antica-del-mondo'),
(27, 'Cultura', 'È morto Henry Kissinger l\'eminenza grigia della Casa Bianca', 'Henry Kissinger, ex segretario di Stato Usa, è morto a 100 anni. A partire dagli Anni \'70, è stato la \"mente\" più o meno occulta dei governi americani.', 'https://www.focus.it/cultura/storia/e-morto-henry-kissinger-l-eminenza-grigia-della-casa-bianca'),
(28, 'Cultura', 'Olocausto: il ruolo chiave dei medici tedeschi nel perpetrare i crimini del regime nazista', 'Eutanasia, sterilizzazioni e macabri esperimenti: più della metà dei medici tedeschi aderì all\'ideologia nazista, contribuendo in modo determinante all\'Olocausto.', 'https://www.focus.it/cultura/storia/medici-ebbero-ruolo-chiave-nel-perpetrare-crimini-nazisti-e-olocausto'),
(29, 'Cultura', 'I pidocchi ci seguono da due milioni di anni (e raccontano molto di noi)', 'I pidocchi si nutrono di sangue umano, hanno bisogno di starci attaccati per sopravvivere: ecco perché sono in grado di raccontare la nostra evoluzione.', 'https://www.focus.it/cultura/storia/abbiamo-pidocchi-da-due-milioni-di-anni'),
(30, 'Cultura', 'Quando è nata la Coppa Davis e perché si chiama così?', 'La Coppa Davis nacque nell\'estate del 1900 sui campi del Logwood Cricket Club di Boston, dove si disputò un torneo di tennis tra una squadra britannica e una americana.', 'https://www.focus.it/cultura/curiosita/quando-e-nata-la-coppa-davis'),
(31, 'Comportamento', 'Vuoi ottenere qualcosa? Tira fuori la rabbia!', 'La rabbia è considerata un\'emozione negativa, inutile e controproducente. Ma siamo sicuri che sia sempre così? Le neuroscienze spiegano perché arrabbiarsi, a volte, ci aiuta.', 'https://www.focus.it/comportamento/psicologia/vuoi-ottenere-qualcosa-tira-fuori-la-rabbia'),
(32, 'Comportamento', 'Preferisco non sapere: perché spesso scegliamo l\'ignoranza?', 'L\'ignoranza intenzionale con la quale decidiamo di non conoscere le conseguenze spiacevoli delle nostre azioni, è in realtà una scusa per agire egoisticamente.', 'https://www.focus.it/comportamento/psicologia/preferisco-non-sapere-perche-spesso-scegliamo-l-ignoranza'),
(33, 'Comportamento', 'Il sesso occasionale consola di più le donne o gli uomini?', 'Cercare sesso occasionale per contrastare alcune emozioni negative non sarebbe di beneficio né per gli uomini né per le donne. Con qualche differenza, ovviamente.', 'https://www.focus.it/comportamento/sessualita/il-sesso-occasionale-consola-piu-uomini-o-donne'),
(34, 'Comportamento', 'Niente social per una settimana: è il segreto per stare meglio? Forse', 'Una settimana di vacanza dai social sembra aver effetti sia positivi, sia negativi sull\'umore, e non causa l\'effetto di astinenza che ci si aspettava.', 'https://www.focus.it/comportamento/psicologia/niente-social-sicuri-che-ci-faccia-stare-meglio'),
(35, 'Comportamento', 'Quanto conta il sesso nella coppia? Le risposte (contrastanti) della scienza', 'Il ruolo del sesso nelle relazioni d\'amore è un argomento controverso. E gli esperti di coppia si dividono discutendo di intesa sessuale e frequenza dei rapporti. Ma non solo.', 'https://www.focus.it/comportamento/sessualita/quanto-conta-sesso-nella-coppia-risposte-contrastanti-della-scienza'),
(36, 'Comportamento', 'Lavorare a fianco di \"colleghi\" robot ci fa diventare pigri?', 'I robot ci aiutano nelle fabbriche o in ufficio, ma lavorando con loro rischiamo di diventare meno produttivi rispetto a quando siamo soli.', 'https://www.focus.it/comportamento/psicologia/lavorare-a-fianco-di-colleghi-robot-ci-fa-impigrire'),
(37, 'Comportamento', 'Genitori o amici: chi influenza di più un adolescente?', 'Per formare l\'autostima di un adolescente che diventa un giovane adulto, la famiglia e i coetanei sono importanti. E forse, tra tutti, lo è ancora di più la mamma.', 'https://www.focus.it/comportamento/psicologia/genitori-o-amici-chi-influenza-di-piu-un-adolescente'),
(38, 'Comportamento', 'Halloween: perché la paura ci può divertire (e farci bene)?', 'Tra la paura che ci fa paura e quella che ci diverte (e che ci rafforza) c\'è differenza. In occasione di Halloween, vediamo in cosa consiste.', 'https://www.focus.it/comportamento/psicologia/halloween-perche-paura-puo-divertire-farci-bene'),
(39, 'Comportamento', 'Davvero i ricchi sono diversi dai poveri? Che effetto fanno i soldi?', 'Come si cambia quando si hanno tanti soldi? In cosa i ricchi sono diversi dagli altri? Sono tutti avari, egoisti e arroganti? Insomma: sono felici o no? Le neuroscienze rispondono.', 'https://www.focus.it/comportamento/psicologia/potere-dei-soldi-tutto-quello-che-e-nella-testa-dei-ricchi'),
(40, 'Comportamento', 'Traumi di guerra: il disturbo da stress post-traumatico e il senso di colpa dei sopravvissuti', 'Il disturbo da stress post-traumatico colpisce molte delle vittime di guerra e le conseguenze sulla psiche sono molto pesanti. E riprendersi è lungo e difficile.', 'https://www.focus.it/comportamento/psicologia/Traumi-guerra-disturbo-stress-post-traumatico-sopravvissuti'),
(41, 'Tecnologia', 'Occhiali “smart” aiuteranno i non vedenti a riconoscere gli oggetti', 'Gli occhiali smart associano alcuni oggetti alla riproduzione di un determinato rumore: una rivoluzione tecnologica per semplificare la vita ai non vedenti.', 'https://www.focus.it/tecnologia/innovazione/occhiali-smart-aiuteranno-i-non-vedenti-a-riconoscere-gli-oggetti'),
(42, 'Tecnologia', 'Ogni anno un miliardo di uccelli muoiono schiantandosi contro edifici. Cosa si può fare per evitarlo?', 'Migrando, un numero enorme di uccelli si schianta ogni anno contro le vetrate di grandi fabbricati. Ecco le soluzioni architettoniche di Chicago e New York.', 'https://www.focus.it/tecnologia/innovazione/come-sono-edifici-bird-friendly-per-evitare-stragi-uccelli-migratori'),
(43, 'Tecnologia', 'Quanti tipi di Generazione Z esistono?', 'Chi sono i \"nativi digitali\" della Generazione Z? Da un\'indagine di Webboh Lab emergono cinque profili differenti di social teenager: i Meme maestro, i Creative explorer, i Social soul...', 'https://www.focus.it/tecnologia/digital-life/quanti-tipi-di-generazione-z-esistono'),
(44, 'Tecnologia', 'L\'aereo anti-turbolenze ha le ali intelligenti', 'Una start-up americana ha messo a punto un\'innovativa strategia per annullare gli effetti delle turbolenze sugli aerei. A vantaggio del comfort e della sicurezza.', 'https://www.focus.it/tecnologia/innovazione/l-aereo-anti-turbolenze-ha-le-ali-intelligenti'),
(45, 'Tecnologia', 'ChatGPT non dà informazioni criminali (ma se glielo chiedi in lingua zulu...)', 'ChatGPT è capace di bloccare i contenuti potenzialmente pericolosi e inappropriati, ma non se riceve istruzioni in lingue che conosce poco.', 'https://www.focus.it/tecnologia/digital-life/chatgpt-da-informazioni-criminali-se-glielo-chiedi-in-lingua-zulu'),
(46, 'Tecnologia', 'Ecco come funziona la mano bionica collegata direttamente a muscoli e nervi', 'Grazie a una protesi innovativa, una donna svedese che ha perso la mano da 20 anni in un incidente agricolo, dimostra come riesce a controllarla in maniera naturale.', 'https://www.focus.it/tecnologia/innovazione/come-funziona-mano-bionica-che-si-fonde-con-ossa-muscoli-e-nervi'),
(47, 'Tecnologia', 'La prima supernova scoperta dall\'intelligenza artificiale (in totale autonomia)', 'Una serie di algoritmi di intelligenza artificiale hanno osservato e identificato un\'esplosione di una supernova. Senza l\'intervento umano.', 'https://www.focus.it/tecnologia/innovazione/l-intelligenza-artificiale-scopre-in-autonmia-la-sua-prima-supernova'),
(48, 'Tecnologia', 'L\'intelligenza artificiale potrebbe rendere Wikipedia più affidabile', 'Un sistema di intelligenza artificiale individua le fonti meno credibili tra quelle usate da Wikipedia, e suggerisce valide alternative. Ma il giudizio finale sta a noi...', 'https://www.focus.it/tecnologia/digital-life/l-ia-potrebbe-rendere-wikipedia-piu-affidabile'),
(49, 'Tecnologia', 'L\'evoluzione di ChatGPT: sempre più “umana”', 'L\'ultima frontiera di ChatGPT: l\'applicazione ora potrà vedere, leggere e parlare, trasformandosi in un \"umano\" con un\'intelligenza artificiale.', 'https://www.focus.it/tecnologia/digital-life/chatgpt-e-sempre-piu-umana'),
(50, 'Tecnologia', 'Guardate come volano sull\'acqua le Formula 1 della vela', 'Un po\' barche a vela, un po\' navi spaziali di Star Wars, sono i vascelli di nuova generazione: supereranno i 150 km/h spinti solo dalla forza del vento.', 'https://www.focus.it/tecnologia/innovazione/guarda-come-volano-su-acqua-le-formula1-della-vela');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `News`
--
ALTER TABLE `News`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
