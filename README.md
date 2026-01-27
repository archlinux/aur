HtmlBuilder
===========
Написанный на FPC/Lazarus генератор статических сайтов
Written in FreePascal/Lazarus generator of static html websites

AI assistant with Ollama mode / ИИ ассистент в режиме Ollama

![AI assistant](https://dl.dropbox.com/scl/fi/k80ekm0vyru76li5at73h/htmlbuilder-with-llm1.png?rlkey=hc5eb9ohb3b6yj3mdi8f8x8cp&st=08r3x8i3)

Html markup preview / Превью разметки HTML

![Html preview](https://dl.dropbox.com/scl/fi/h9pif4djp87pmvvaq07y3/htmlbuilder-with-llm2.png?rlkey=32lw001qazg4mx7sc83s7nq32&st=rz07uxzp)

Earlier UI sample (localization) / Прежний вид интерфейса (локализация)

![Screen pages editor](https://dl.dropboxusercontent.com/scl/fi/3xj9ex9tl2hmin1h6iiph/main_screen_new.png?rlkey=e3ij7tte6uyju2fbjt66yh7dn&st=o78x64zd)

Built-in webserver / Встроенный веб-сервер

![With own webserver](https://www.dropbox.com/s/m9d4ccf2gynwvaq/web_server.png?raw=1)

Update content / Обновление контента

![Using ftp](https://www.dropbox.com/s/8a23veig21gqcei/ftp_updater.png?raw=1)

Uploading with bridge / Выгрузка с помощью моста

![Using bridge API](http://apprr.rf.gd/upload_with_a_bridge.png)

Filtering content

![Filter by category only](https://dl.dropbox.com/scl/fi/5zeyzh87ljx7jr3rxlfdx/filtering_I.png?rlkey=ozz1jiufs6ihd2cuc4y9d4gkw&st=hlc92vlj)

![Filter by field only](https://dl.dropbox.com/scl/fi/0ox2zmmtvib69uwa50i9c/filtering_II.png?rlkey=w9p4yudgx9lptdk4n5shek9iu&st=avlbq8wg)

![Filter both by category and field](https://dl.dropbox.com/scl/fi/glpe28tsct076clwo31rg/filtering_III.png?rlkey=3b006wdktep7zxvnib7w3iecf&st=aw87djhg)

More screens / Больше скриншотов https://apprr.rf.gd/HtmlBuilder/
Some articles / Некоторые статьи [blog](http://artnazarov.github.io/section_htmlbuilder.html)

Project / Проект
================
Website in Russian / Сайт на русском
[HtmlBuilder project page: actual on https://apprr.rf.gd/HtmlBuilder/](https://apprr.rf.gd/HtmlBuilder/)

Documentation for developers / Документация для разработчика
[PasDoc documention: actual on https://apprr.rf.gd/HtmlBuilderDocs/main.html](https://apprr.rf.gd/HtmlBuilderDocs/main.html)

Blog with examples / Блог с примерами
[Blog: actual on https://artnazarov.github.io/section_htmlbuilder.html](https://artnazarov.github.io/section_htmlbuilder.html)

Tilda presentation
[HtmlBuilder page on Tilda](https://htmlbuilder.tilda.ws/)

Usage / Использование
================
Will be useful for creating websites hosted at P2P networks
( such Maelstrom, FreeNet, I2P etc ) or jamstack hostings
like Vercel
Может быть полезен для создания сайтов, используемых
в пиринговых сетях или хостингах jamstack типа Vercel


What's new / Что нового
================
1. Engine now use sqlite. Движок использует sqlite
2. Can use annotations and full descriptions at sections.
Аннотации и полные описания к разделам
3. Using tags. Использование тегов
4. Tree/flat structure. Плоская/древовидная структура сайта
5. Autosave/autoload special settings. Автосохранение/загрузка настроек
6. Backup database / Резервное копирование базы
7. Commit to github pages / Публикация на GH pages
8. Wysiwyg editor addition example / Пример дополнения с Wysiwyg
9. Menu constructor / Конструктор меню
10. Custom fields in content / Пользовательские поля в контенте
11. Uploading with bridge API / Выгрузка с помощью bridge API
12. Writing builded files in separate threads / Запись собранных файлов в несколько потоков
13. Storing images in sqlite3 blob and quick image links / Хранение иллюстраций в поле BLOB базы sqlite3
и быстрые ссылки на изображения вида

```
((image_id))
```

Note: the preview is disabled if the markup contains raw image tag. Use quick image links instead of img tag. 

14. Translations to English, Spanish, Chinese, Korean Munhwaŏ / Переводы на английский, испанский, китайский, корейский

15. Storing attached documents in blob / Хранение прикрепленных документов
Will placed in folder /files/
```
||document_id||

```
16. Drag and drop files from file manager into templates / Перетаскивание файлов из файлового менеджера в шаблоны

![Attachments](https://htmlbuilder.onhalt.site/images/files_ui.png)

![Example1](https://htmlbuilder.onhalt.site/images/images1_demo.png)

![Example2](https://htmlbuilder.onhalt.site/images/images2_demo.png)

![Example3](https://htmlbuilder.onhalt.site/images/images3_demo.png)

![Example4](https://htmlbuilder.onhalt.site/images/images4_demo.png)

17. Emojies by shortcodes / Эмодзи по шорткодам

18. Quick add js code statements with shortcuts / Быстрое добавление операторов кода js с помощью горячих клавиш

19. Screen keyboard for typing HTML mnemonics / Экранная клавиатура для набора мнемоник HTML

20. Reformatting of markup / Переформатирование разметки

21. Hide tabs / Скрытие вкладок

22. Quick switching to tab / Быстрое переключение на вкладку

23. Adding css properties using menu items / Добавление свойств CSS с помощью пунктов меню

24. Chat with Ollama AI server / Чат с AI сервером Ollama 

25. Current date and time funcs / Функции текущих даты и времени

How to use: place GETDATE(), GETTIME()

27. Approx. count time to reading, total amount words, sentences and characters
/ Приблиз. подсчет времени на дочитывание, общее количество слов, предложений и символов

How to use: place WORDS(), SENTS(), CHARS(), TTR()

28. Internal backlinks / Обратные ссылки

29. Random data at first run / Случайные данные на первом запуске

30. Parameterizable blocks / Параметризуемые блоки

For a global block to be parameterizable, it must contain at least one block variable of the form *varname
Чтобы глобальный блок стал параметризуемым, он должен содержать хотя бы одну переменную блока вида *varname

В шаблоне вывод конкретизированного блока осуществляется через передачу фактических значений переменных
The output of concrete block is perfomed by passing actual values

```
{blockname >< varname=`value` othername=`othervalue` >< }
```
Note / Примечание - Между { и именем блока не должно быть пробела. There is must no space between { and block name.

Пример: пусть имеются блоки, содержащие переменные блоков ```*var``` и ```*other```

The example: block1 has markup ```*var``` and block2 has markup ```*other```

Когда шаблон задан как / When the template is 
```
{block1 >< var=`Test` >< } is {block2 >< other=`great` >< }
```
Результат подстановки будет / The result of the substition will be
```
Test is great
```

31 Оператор / Operator @repeat

Размножает последовательно образец, подставляя в тиражируемый фрагмент значения переменной
Replicates the sample sequentially, substituting the variable values into the replicated fragment

Пример / Example

@repeat { color = red|green|blue } [[Color: &color; ]].

преобразуется до / transform to

Colors: Color: red Color: green Color: blue.

Примечание / Note: вывод обрезается от пробельных символов / the output will be trimmed from space characters

32 Оператор / Operator @ifelse

Outputs text corresponding comparison
Выводит текст согласно сравнения

@ifelse[leftString]comparison[rightString]{stringIfTrue}{stringIfFalse};

Примечание / Note  Сравнение может быть == или != не равно. Comparison maybe == or != not equal.

Для примера / For example, 

@ifelse[0]==[0]{A}{B}; преобразуется до / transforms to A 
@ifelse[A]!=[B]{X}{Y}; преобразуется до / transforms to X

33 @db Рендеринг элементов по произвольному запросу к базе / Render items by custom sql request

For example / Для примера 
```
@db(caption|content|caption LIKE 'Caption For A%')=>(<div>{caption}</div>);
```
создает представление / produce view:
```
<div>Caption for ATlj8wrAT3CcIw3d34YSuSgaacXTFXT4</div><div>Caption for auBDhpiFlfPe0V4nwCFLkNryAWKIqUau</div><div>Caption for AjwwhevKimYoFU8mstZYUs0xsNWn8suz</div><div>Caption for aaX7qPBPd6xDHC7mmOtrQ26XZCd2Jvya</div><div>Caption for A6HJ9iefcPjeghHegjb3KBKh8B7bnlNm</div><div>Caption for a9q9J1k2yNxyyzIvbCYnjB98mx30Pw1N</div><div>Caption for aQnlpeYPiJygx71SXvZXaf0DfgxXJjkf</div>
```
Таким образом, оператор @db имеет форму / So operator @db must have the form
```
@db(field1,fieldN|tableName|conditionPart)=>(templatePart);
```

34 Autosave when exiting the application and before building 
/ Автосохранение при выходе из приложения и перед сборкой

35 Application's cache for rebuilds / Кеш приложения для пересборок

36 Автозагрузка и применение палитр / Autoloading and applying palettes
[The tool to make a palette file](https://github.com/ArtNazarov/colorpalette)

Note: color alias mush have name in the template like `_color_`
Palettes must be placed in the app folder.

37 Content filtering by category and field / Фильтрация контента по категории и полю

# Serverside endpoints

PHP endpoint for server https://github.com/ArtNazarov/htmlbuilder-php-bridge

Docker image with PHP https://github.com/ArtNazarov/dockerbridgephp

Nodejs endpoint for server https://github.com/artNazarov/htmlbuilder-nodejs-bridge

Docker image with NodeJs https://github.com/ArtNazarov/dockerbridgenodejs

Python endpoint https://github.com/ArtNazarov/htmlbuilder-python-bridge


More info in / больше информации english_help / russian_help.txt

Tutorial
==============
Read [how to create page](https://github.com/ArtNazarov/HtmlBuilder/wiki/How-to-create-new-page) in Wiki


Installation
==============

1) Install for Linux using [HtmlBuilder_installer](https://github.com/ArtNazarov/HtmlBuilder_installer)
2) or download pre-release from [releases](https://github.com/ArtNazarov/HtmlBuilder/releases)


Troubleshooting
================

1. Error while loading shared libraries: libQt5Pas.so.1:
cannot open shared object file: No such file or directory

Install qt5pas

```
yay -Sy qt5pas
```
2. If running on Linux Mint 22 Wilma - should install libraries:

```
sudo apt-get install libqt5pas1
sudo apt-get install libsqlite3-dev
```
3. On RedOS should be installed shared libraries before compiling

```
sudo dnf install qt5pas
sudo dnf install libcanberra-devel
sudo dnf install libcanberra-gtk2
sudo dnf install libcanberra-gtk3
sudo dnf install libcanberra
sudo dnf install qt5-qtbase-gui
sudo dnf install qt5-qtbase-devel
sudo dnf install lazarus-lcl-qt5
sudo dnf install libsq3-devel
```
4. Compiling on MX Linux 23.3 Before installing Lazarus and fpc:

   ```
   sudo apt-get install libqt5pas-dev libqt5pas1
   sudo apt-get install libsqlite3-0 libsqlite3-dev
   ```

After installing libraries, open lpi file in Lazarus IDE and compile

Ollama client
=====
To use LLM with HtmlBuilder, you should install ollama server using package mananger and enable ollama service, for example, on ArchLinux it is
```
yay -S ollama
sudo systemctl enable ollama.service
sudo systemctl start ollama.service   
```

After load some model, for example tinyllama.
Run server with chosen model before launching HtmlBuilder
```
 ollama pull tinyllama
 ollama run tinyllama
```

Tests
=====

https://github.com/ArtNazarov/HtmlBuilder_tests

Database scheme
=====
![Sqlite3 tables](https://dl.dropbox.com/scl/fi/2i9bdacrksh1tpbtcfm81/sqlite.png?rlkey=qvxrzy9vphfknd08krg4uzo1q&st=njck97ib)

MDI Interface
===
[MDI variant of interface, just for demo purposes](https://github.com/artNazarov/STARTER_HTMLBUILDER)
