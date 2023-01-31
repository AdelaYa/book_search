mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	5.7.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
mysqldump: Error: 'Access denied; you need (at least one of) the PROCESS privilege(s) for this operation' when trying to dump tablespaces

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `fio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES ('Гастов Алекс',1),('Хасс Дж. Э.',2),('Верди Алиса',3),('Толль Вероника',4),('Данжелико П, (EN)',5),('Евтушенко Валерий Федорович',6),('\"Eiya Ell\"',7),('Маркес Габриэль Гарсиа',8),('Ос Ксения',9),('Максимова София',10),('Дашкова Ольга',11),('Иванова Вероника Евгеньевна',12),('Аббасов Талех',13),('Свечин Николай',14),('Шляхов Андрей',15),('Аарон Рэйчел',16),('Михайлов Дем',17),('О\'Салливан Колин',18),('Сказ Алекс',19),('Смышляева Ольга',20);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_to_author`
--

DROP TABLE IF EXISTS `book_to_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_to_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_to_author`
--

LOCK TABLES `book_to_author` WRITE;
/*!40000 ALTER TABLE `book_to_author` DISABLE KEYS */;
INSERT INTO `book_to_author` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `book_to_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_to_genre`
--

DROP TABLE IF EXISTS `book_to_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_to_genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_to_genre`
--

LOCK TABLES `book_to_genre` WRITE;
/*!40000 ALTER TABLE `book_to_genre` DISABLE KEYS */;
INSERT INTO `book_to_genre` VALUES (1,1),(1,2),(2,3),(3,4),(4,5),(5,3),(6,1),(7,3),(7,6),(8,7),(9,5),(10,3),(11,3),(11,6),(12,8),(12,9),(13,1),(14,10),(15,11),(16,1),(17,8),(17,12),(18,13),(19,14),(20,15);
/*!40000 ALTER TABLE `book_to_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Наследник Бури 2 (СИ)','Я обрёл новую жизнь в мире, где в центре империи бушует великий Вихрь, а власть поделили Рода одарённых, получившие от него свою силу.\nВихрь стал источником богатства, но также и постоянной угрозой, и адепты новой веры предрекают рождение мессии, одарённого, способного обуздать непокорную стихию.\nВот только способности достались подонку, перерождённому из другого мира. Мне.\nИ никто из них не собирается воздавать мне почести, наоборот. Изменение миропорядка никому не выгодно, и непокорного мессию проще убить.\nНо меня уже не остановить. На кону стоит намного больше, чем просто власть.','/data/Book/0/809000/809979/BC4_1675154161.jpg'),(2,'Мистер Совершенство (ЛП)','Введите сюда краткую аннотацию\nЖелание к идеальному мужчине совсем не сводит меня с ума. Я просто знаю, что именно мне нравится.\nМогущественный миллиардер в строгом костюме даже не был моим первоначальным выбором. МакАллистер Стоунволл никогда не рассматривался в этом качестве, я даже не знала о его существовании.\nНо сейчас уж точно знаю.\nИ теперь не могу перестать думать о его руках на моем теле. О горячей груди, которой он прижимается к моей обнаженной спине, когда наклоняет над своим рабочим столом.\nОн — исполнение моих самых запретных желаний. Моя новая тайная одержимость. Мой мистер Совершенство.\nНо затем наступает момент, когда я осознаю… Совершенства не существует.','/data/Book/0/809000/809978/BC4_1675154111.jpg'),(3,'Хотите поиграть, босс? (СИ)','В моей жизни неприятности следуют одна за другой: развод, потеря работы, долги. И уже, казалось бы, хуже быть не может… Оказалось — может.\nВсе стало куда хуже, когда выяснилось, что босс на новой работе — моя первая школьная любовь. Возмужавший и чертовски привлекательный!\nИ все бы ничего, но он затаил на меня обиду, и теперь вознамерился отомстить, превратив мою жизнь в ад. Но я так просто сдаваться не собираюсь!\nХотите поиграть, босс? Посмотрим, кто кого!','/data/Book/0/809000/809977/BC4_1675154084.jpg'),(4,'Химера мастера Терра (СИ)','Она бежала от преследователей в Академию магических искусств Истрарии, единственное место на материке, где, по мнению своего учителя, могла чувствовать себя в относительной безопасности. Она была готова довериться совершенно незнакомому мужчине только лишь потому, что он принадлежал к очень редкой, почти вымирающей расе. Она не ставила на кон свою жизнь, но не ожидала, что внезапно нахлынувшие чувства заставят отказаться от четко выверенного плана и погонят в темноту зимней ночи.','/data/Book/0/809000/809976/BC4_1675154057.jpg'),(5,'Как спасти жизнь (ЛП)','У Райли Джеймс есть ради чего жить: бизнес, который необходимо развивать; цели, которые нужно достигать. После всех выпавших на нее испытаний, она не позволит кому-либо встать на пути ее надежд и мечтаний. И даже привлекательному бизнесмену, который делает ей безумное предложение, отказаться от которого еще более безумно.\nДжордан Уэст имеет все, что может только пожелать мужчина. Но все же его не оставляет ощущение бессмысленности жизни. Но когда случается трагедия и ему доверяют заботу о двухлетней малышке, жизнь уже не выглядит такой бессмысленной. У Джордана Уэста внезапно появляется то, ради чего стоит жить. Проблема в том… как удержать это ощущение?\nЕсть не один способ спасти жизнь…','/data/Book/0/809000/809975/BC4_1675153987.jpg'),(6,'Последний характерник (СИ)','Это продолжение серии «Днем казак, ночью волк».\nСерко и Верныдуб возвращаются из Франции до Подолии. А дома их ждут новые битвы.','/data/Book/0/809000/809969/BC4_1675153876.jpg'),(7,'Пять с половиной недель (СИ)','Уважаемые читатели! Это книга не такая, какую вы привыкли читать. Тут нет первой любви, разлуки, встречи через время, и вновь вспыхнувшие чувства!','/data/Book/0/809000/809966/BC4_1675153833.jpg'),(8,'Скандал столетия','Габриэль Гарсиа Маркес – величайший писатель ХХ века, лауреат Нобелевской премии, автор всемирно известных романов «Сто лет одиночества», «Любовь во время чумы» и «Осень патриарха».\nНа протяжении всей своей жизни Маркес неоднократно подчеркивал, что в первую очередь считает себя журналистом и немалую часть своего времени посвятил именно репортерской деятельности. Более того – он уверял, что даже свои художественные тексты выстраивал по принципу газетной статьи. Однако те, кто читал его публицистику, с уверенностью скажут, что дело обстояло ровно наоборот: свои газетные и журнальные статьи Маркес писал не как сухие отчеты, а как настоящие художественные произведения. И в полной мере это относится к центральному произведению сборника – «Скандал столетия», написанному в жанре документального детектива. Автор мастерски захватывает внимание читателя с первых же слов и не отпускает его до самой последней страницы.\n* * *\n9 апреля 1953 года ушла из дома и не вернулась юная римская красавица Вильма Монтези. Сутки спустя ее тело – полураздетое, но без следов сексуального насилия – выбросило на берег морскими волнами. Полиция предполагает несчастный случай. И в самом деле, кому могла помешать дочь добропорядочного плотника и счастливая невеста молодого полицейского?\nТак начинается потрясшая всю Италию головокружительная криминальная история, в которой оказались задействованы гангстеры и звезды эстрады, «золотая молодежь» и крупные политики, актрисы, авантюристы и элитные «ночные бабочки».','/img/nocover.png'),(9,'Древний мир для попаданки 2 (СИ)','Продолжение к книге «Древний мир для попаданки». Только теперь у Марии появляются подруги по несчастью со своими нелегкими судьбами и предназначениями, а еще вредная сущность. Только не понятно — враг она или друг. Похоже, разбираться во всем этом и своем предназначении в мире придется им самим, а еще пополнить племя, спасти друга и… в общем, много чего!','/data/Book/0/809000/809963/BC4_1675153792.jpg'),(10,'Дело было в Бельдяжках (СИ)','Изменил без пяти минут муж? Не беда! Отправляют в командировку в Бельдяжки? Не отчаивайся! Ведь там судьба приготовила для тебя замечательный подарок — мужчину, чье сердце давно истосковалось по любви и ласке! Осталось только убедить его покориться этой самой судьбе и сдаться на твою милость!','/data/Book/0/809000/809962/BC4_1675153762.jpg'),(11,'Аукцион невинности. Двойная ставка (СИ)','—Тебе страшно?\n—Нет,— соврала, хочу, чтоб все быстрее началось и закончилось.\n—Сними одежду.\n—Что?— теряюсь от такого прямого приказа.\n—Мы заплатили за твою девственность большую сумму, удвоив ставку. Снимай все.\nМы? Это оговорка, или нет?\nНачинаю задыхаться, хочу отстраниться, но мне не дают.\nЗа спиной шаги, движение. На плечо опускается рука, сухая горячая ладонь, сильные пальцы сжимают до боли.\nА до меня доходит его сказанное: «Мы».\nЯ продала свою несуществующую девственность на аукционе, в надежде спасти дочь. Меня купили сразу двое, но их не обмануть, а мне не уйти просто так.','/data/Book/0/809000/809961/BC4_1675153732.jpg'),(12,'Argumentum ad hominem (СИ)','Любая достаточно развитая технология неотличима от магии.\nВсе мы видели как певец зажигает стадион, в этом же мире сказка о сиренах стала явью: песней можно поддержать, вылечить, погасить…\nА если ты необычный, не такой, ты — дирижер на концерте Manowar?\nИ вместе с тем ты боец спецотряда, над которым проводят странные эксперименты?','/data/Book/0/809000/809960/BC4_1675153701.jpg'),(13,'Пробуждение Ваирагии (СИ)','Ардан — мир людей — погрузился в сон невежества и безнравственности. Подавляющее большинство утратило способности, и лишь немногие всё ещё умеют управлять магией. Но даже она — всего лишь тень от былого величия. Настали тёмные времена, когда человеческая жизнь не более, чем дорожная пыль под сапогами солдат. И вот, спустя девять с лишним веков со дня окончания великой войны против древнего врага, родится мальчик, с которым вернётся забытое, откроется память предков, пробудится ваирагия…','/data/Book/0/809000/809959/BC4_1675153672.jpg'),(14,'Как Лыков не стал генералом','Если вы думаете, что искусство эскорта– явление современности, то вы ошибаетесь. Им владели женщины еще вовремена Империи, вкоторой даже Великий князь небыл чужд плотских утех. Интрига, связанная сего любовницей, легла воснову повести. Какбыть женщине, если унее два любовника, авыбрать нужно одного? Возможно единственный выход– исчезнуть изчисла живых…','/data/Book/0/809000/809869/BC4_1675143277.jpg'),(15,'Притчи приемного покоя','Здесь вершатся судьбы и выставляются диагнозы. Здесь жизнь бьет ключом и покой всем только снится. Что наша жизнь? Суета за пределами приемного покоя! Эта книга не о Приемном Покое, а о тех путях, которые приводят сюда людей и, конечно же, о любви.','/data/Book/0/809000/809829/BC4_1675094850.jpg'),(16,'Один хороший дракон заслуживает еще одного (ЛП)','После махинаций жуткой матери, двух всезнающих пророков и кучи кровожадной родни Джулиус не хочет видеть драконов. К сожалению для него, опаснее, чем быть бесполезным Хартстрайкером, только быть полезным, и теперь, когда он знаком с Тремя Сестрами, Джулиус стал ключевой пешкой в игре Бетезды для поднятия ее клана на вершину.\nОтказ подыграть планам матери означает смерть, но происходит больше, чем даже Бетезда знает, и Эстелла вернулась в игру с жаждой мести. Будущее Хартстрайкеров пропадает, охотник на драконов Алгонквин все ближе, и ставки выше, чем даже пророк может подсчитать. Но когда самые сильные члены семьи начинают падать, как мухи, Джулиусу приходится защищать клан, который не уважал его, и доказывать, что иногда худшего в мире дракона лучше иметь на своей стороне.','/data/Book/0/809000/809816/BC4_1675083789.jpg'),(17,'ПД 3 (СИ)','Продолжение цикла Пылающие Дюзы.\nЭто история о молодом охотнике за головами Тиме Градском, чья задача — находить и уничтожать приговоренных к смерти преступников, что в свое время успели скрыться от правосудия. Космос невероятно велик, тут есть где затеряться, но гроссы сделают все, чтобы найти беглеца и покарать его.\nТим Градский еще не успел сделать себе имени в Лиге Гроссов... но он старательно движется по этому пути, изо всех сил стараясь остаться человечным и справедливым. В этом ему помогает верная команда и преданный до последнего бита ИскИн Лео, что всегда найдет повод побрюзжать...','/data/Book/0/809000/809815/BC4_1675083680.jpg'),(18,'Черная сакура','Землетрясения, цунами и селевые потоки сеют смерть и разрушения. Жители забытого богами и властями кусочка суши утратили надежду. Даже сакуры здесь не цветут по весне, а безжизненно тянут к небу черные узловатые ветви…\nУчитель физкультуры по кличке Томбо (Стрекоза) одинок: его дочь унесло волной, жена молча умирает в своей постели. Но он еще молод, его тело жаждет объятий, сердце— любви, а душа— радости. Томбо проводит свои дни в тоске и печали. Но однажды постигает простую истину: человек чего-то стоит, только если, отринув грех уныния, выбирает жизнь со всеми ее проблемами, несмотря на любые внешние обстоятельства.','/data/Book/0/809000/809814/BC4_1675080329.jpg'),(19,'Темный Герой (СИ)','У тебя есть любящая семья? Круто. Хорошая работа? Отлично. Друзья и коллеги? Замечательно. Социальный статус? Супер. Дом, машина, хороший отдых, хобби… Наверняка ты потратил немало времени и сил, чтобы это заполучить. Гордишься собой? Зря! Это не стоит ни ломанного гроша. Чем ты счастливее, тем легче можешь все потерять. Может тогда ты хоть немного поймешь мою жажду… ЖАЖДУ СИЛЫ!','/data/Book/0/809000/809813/BC4_1675080218.jpg'),(20,'Спокойно, тётя Клара с вами (СИ)','Строптивые племянники с \"взрывными\" талантами — есть!\nЧиновники бюрократы с эффективным менеджером из столицы — есть!\nСмертельная тайна государственной важности — есть!\n…как, ещё и паспорт нужен?!\nНе таким Клара представляла себе мир, куда ей пришлось переехать, согласно завещанию погибшей сестры. Но дороги назад нет — документы на получение гражданства королевства Райм поданы. Клара пойдёт до конца, и всё, что встанет у неё на пути — само станет путём!','/data/Book/0/809000/809812/BC4_1675079962.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES ('Фэнтези',1),('Бояръ-Аниме',2),('Современные любовные романы',3),('Короткие любовные романы',4),('Любовно-фантастические романы',5),('Эротика',6),('Зарубежная публицистика',7),('Боевая фантастика',8),('Детективная фантастика',9),('Исторические детективы',10),('Современная проза',11),('Космическая фантастика',12),('Социально-философская фантастика',13),('Альтернативная история',14),('Юмористическое фэнтези',15);
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31 17:17:42
