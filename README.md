HtmlBuilder
===========
Написанный на FPC/Lazarus генератор статических сайтов
Written in FreePascal/Lazarus generator of static html websites

UI sample / Примерный вид интерфейса

![Screen pages editor](https://dl.dropboxusercontent.com/scl/fi/3xj9ex9tl2hmin1h6iiph/main_screen_new.png?rlkey=e3ij7tte6uyju2fbjt66yh7dn&st=o78x64zd)

Built-in webserver / Встроенный веб-сервер

![With own webserver](https://www.dropbox.com/s/m9d4ccf2gynwvaq/web_server.png?raw=1)

Update content / Обновление контента

![Using ftp](https://www.dropbox.com/s/8a23veig21gqcei/ftp_updater.png?raw=1)

Uploading with bridge / Выгрузка с помощью моста

![Using bridge API](http://apprr.rf.gd/upload_with_a_bridge.png)

More screens / Больше скриншотов https://htmlbuilder.onhalt.site/
Some articles / Некоторые статьи [blog](http://nazarow.ru/section_htmlbuilder.html)

Project / Проект
================
Website in Russian / Сайт на русском
[HtmlBuilder project page](https://htmlbuilder.onhalt.site)

Documentation for developers / Документация для разработчика
[PasDoc documention](https://htmlbuilder-docs.onhalt.site)

Blog with examples / Блог с примерами
[Blog](https://nazarow.ru/section_htmlbuilder.html)

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

PHP endpoint for server https://github.com/ArtNazarov/htmlbuilder-php-bridge

Docker image with PHP https://github.com/ArtNazarov/dockerbridgephp

Nodejs endpoint for server https://github.com/artNazarov/htmlbuilder-nodejs-bridge

Docker image with NodeJs https://github.com/ArtNazarov/dockerbridgenodejs

Python endpoint https://github.com/ArtNazarov/htmlbuilder-python-bridge


More info in / больше информации english_help / russian_help.txt


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

Tests
=====

https://github.com/ArtNazarov/HtmlBuilder_tests

