### OVERVIEW
1. [Introduction](Tutorial_01_Intro)
2. [Cutelyst Basics](Tutorial_02_CutelystBasics)
3. [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
4. [Basic CRUD](Tutorial_04_BasicCRUD)
5. [Authentication](Tutorial_05_Authentication)

### DESCRIPTION

This chapter of the tutorial builds on the work done in Chapter 2 to explore some features that are more typical of "real world" web applications. From this chapter of the tutorial onward, we will be building a simple book database application. Although the application will be too limited to be of use to anyone, it should provide a basic environment where we can explore a variety of features used in virtually all web applications.

### CREATE A NEW APPLICATION

The remainder of the tutorial will build an application called MyApp. First use the Cutelyst cutelyst command to initialize the framework for the MyApp application (make sure you aren't still inside the directory of the Hello application from the previous chapter of the tutorial or in a directory that already has a "MyApp" subdirectory):

```bash
$ cutelyst2 --create-app MyApp
 created "MyApp"
 created "MyApp/CMakeLists.txt"
 created "MyApp/build"
 created "MyApp/root"
 created "MyApp/src"
 ...
```

Change to application directory, then build directory and Run "cmake .." to make sure your install is complete

And change the "MyApp" directory the helper created:

```bash
$ cd MyApp
```

This creates a similar skeletal structure to what we saw in Chapter 2 of the tutorial, except with MyApp and myapp substituted for Hello and hello.

Cutelyst used to create an application with `Cutelyst::StaticSimple` plugin enabled by default, StaticSimple provides an easy way to serve static content, such as images and CSS files, from within your application.

However it's much better to use cutelyst (or uwsgi) `--static-map` or serve them with your front web server. Which is why this plugin doesn't come enabled by default anymore.

When adding new plugins make sure you pass the Cutelyst::Application as their parent so they get automatically registered, as well as adding it's new dependency within the CMakeLists.txt file.

### CREATE A CUTELYST CONTROLLER

As discussed earlier, controllers are where you write methods that interact with user input. Typically, controller methods respond to GET and POST requests from the user's web browser.

Use the Cutelyst cutelyst command to add a controller for book-related actions:

```
$ cutelyst2 --controller Books
 created "/home/daniel/code/MyApp/src/books.h"
 created "/home/daniel/code/MyApp/src/books.cpp"
Now, on your application class include and instantiate the controller.
```

To register and instantiate the controller, add to your src/myapp.cpp:

```c++
...
#include "books.h"
...
bool MyApp::init()
{
    ....
    new Books(this);
    ....
}
```

Then edit src/books.h and add the method "list" to the controller:

```c++
class Books : public Controller
{
...
/**
 * Fetch all book objects and pass to books/list.html in stash to be displayed
 */
C_ATTR(list, :Local)
void list(Context *c);
};
```

And in src/books.cpp the implementation:

```c++
void Books::list(Context *c)
{
    // c is the Cutelyst::Context that's used to 'glue together'
    // the various components that make up the application

    // Retrieve all of the book records as book model objects and store in the
    // stash where they can be accessed by the Grantlee template
    // c->setStash("books", sql result);
    // But, for now, use this code until we create the model later
    c->setStash("books", "");

    // Set the Grantlee template to use. You will almost always want to do this
    // in your action methods (action methods respond to user input in
    // your controllers).
    c->setStash("template", "books/list.html");
}
```
Here we see "Cutelyst Context object", which is automatically passed as the first argument to all Cutelyst action methods. It is used to pass information between components and provide access to Cutelyst and plugin functionality.

Cutelyst Controller actions are regular C++ class methods, but they make use of attributes (the ":Local" inside the C_ATTR macro which also makes the method invokable) to provide additional information to the Cutelyst dispatcher logic (note that there can be an optional space between the colon and the attribute name; you will see attributes written both ways). Most Cutelyst Controllers use one of five action types:

**:Private** -- Use :Private (or place your method under private section) for methods that you want to make into an action, but you do not want Cutelyst to directly expose the method to your users. Cutelyst will not map :Private methods to a URI. Use them for various sorts of "special" methods (the Begin, Auto, etc. discussed below) or for methods you want to be able to forward or detach to. (If the method is a "plain old method" that you don't want to be an action at all, then just define the method without any attribute -- you can call it in your code, but the Cutelyst dispatcher will ignore it.
There are five types of "special" built-in :Private actions: Begin, End, Default, Index, and Auto.

With Begin, End, Default, Index private actions, only the most specific action of each type will be called. For example, if you define a Begin action in your controller it will override a Begin action in your application/root controller -- only the action in your controller will be called.
Unlike the other actions where only a single method is called for each request, every Auto action along the chain of namespaces will be called. Each Auto action will be called from the application/root controller down through the most specific class.

**:Path** -- :Path actions let you map a method to an explicit URI path. For example, ":Path('list')" in src/books.h would match on the URL http://localhost:3000/books/list, but ":Path('/list')" would match on http://localhost:3000/list (because of the leading slash). You can use :Args() to specify how many arguments an action should accept.

**:Local** -- :Local is merely a shorthand for ":Path('_name_of_method_')". For example, these are equivalent: "C_ATTR(create_book, :Local) ... (Context*) {...}" and "C_ATTR(create_book, :Path("create_book")) ... {...}".

**:Global** -- :Global is merely a shorthand for ":Path('/_name_of_method_')". For example, these are equivalent: "C_ATTR(create_book, :Global) ... {...}" and "C_ATTR(create_book, :Path("/create_book")) ... {...}".

**:Chained** -- Newer Cutelyst applications tend to use the Chained dispatch form of action types because of its power and flexibility. It allows a series of controller methods to be automatically dispatched when servicing a single user request. See Cutelyst::Manual::Tutorial::04_BasicCRUD and Cutelyst::DispatchType::Chained for more information on chained actions.

### CUTELYST VIEWS

As mentioned in Chapter 2 of the tutorial, views are where you render output, typically for display in the user's web browser (but can generate other types of output such as PDF or JSON). The code in src/myapp.cpp selects the type of view to use, with the actual rendering template found in the root directory. As with virtually every aspect of Cutelyst, options abound when it comes to the specific view technology you adopt inside your application. However, most Cutelyst applications use the Grantlee (for more information on TT, see http://www.grantlee.org). At the moment other somewhat popular view technology is ClearSilver (http://www.clearsilver.net/).

#### Register a Cutelyst View

It is now up to you to decide how you want to structure your view layout. For the tutorial, we will start with a very simple Grantlee template to initially demonstrate the concepts, but quickly migrate to a more typical "wrapper page" type of configuration (where the "wrapper" controls the overall "look and feel" of your site from a single file or set of files). Edit src/myapp.cpp:

```c++
....
#include <Cutelyst/Plugins/View/Grantlee/grantleeview.h>
....
bool MyApp::init()
{
    ....
    auto view = new GrantleeView(this);
    view->setIncludePaths({ pathTo("root/src") });
    ....
}
```

And link to Grantlee, adding to src/CMakeLists.txt:

```cmake
target_link_libraries(MyApp
    ...
    Cutelyst::View::Grantlee # Add this line
    ...
}
```

This changes the base directory for your template files from root to root/src.

Please stick with the settings above for the duration of the tutorial, but feel free to use whatever options you desire in your applications.

Note: We will use root/src as the base directory for our template files, with a full naming convention of root/src/_controller_name_/_action_name_.html. Another popular option is to use root/ as the base (with a full filename pattern of root/_controller_name_/_action_name_.html).

#### Create a Grantlee Template Page

First create a directory for book-related templates:

```bash
$ mkdir -p root/src/books
```

Then create root/src/books/list.html in your editor and enter:

```html
{% comment %}This is a Grantlee comment.{% endcomment %}

{% comment %}Some basic HTML with a loop to display books{% endcomment %}
<table>
<tr><th>Title</th><th>Rating</th><th>Author(s)</th></tr>
{% comment %}Display each book in a table row{% endcomment %}
{% for book in books %}
  <tr>
    <td>{{ book.title }}</td>
    <td>{{ book.rating }}</td>
    <td></td>
  </tr>
{% endfor %}
</table>
```

As indicated by the inline comments above, the **for** loop iterates through each book model object and prints the title and rating fields.

The {% and %} tags are used to delimit Grantlee code. Grantlee supports a wide variety of directives for "calling" other files, looping, conditional logic, etc. In general, Grantlee simplifies the usual range of Qt introspection properties down to the single dot (".") operator. This applies to properties, hash lookups, and list index values.

TIP: While you can build all sorts of complex logic into your Grantlee templates, you should in general keep the "code" part of your templates as simple as possible.

#### Test Run The Application

To test your work so far, compile then start the development server:

```bash
$ make && cutelyst2 -r --server --app-file src/libMyApp -- --chdir ..
```

Then point your browser to http://localhost:3000 and you should still get the Cutelyst welcome page. Next, change the URL in your browser to http://localhost:3000/books/list. If you have everything working so far, you should see a web page that displays nothing other than our column headers for "Title", "Rating", and "Author(s)" -- we will not see any books until we get the database and model working below.

If you run into problems getting your application to run correctly, it might be helpful to refer to some of the debugging techniques covered in the Debugging chapter of the tutorial.

### CREATE A SQLITE DATABASE

In this step, we make a text file with the required SQL commands to create a database table and load some sample data. We will use SQLite (http://www.sqlite.org), a popular database that is lightweight and easy to use. Be sure to get at least version 3. Open myapp01.sql in your editor and enter:

```sql
--
-- Create a very simple database to hold book and author information
--
PRAGMA foreign_keys = ON;
CREATE TABLE book (
        id          INTEGER PRIMARY KEY,
        title       TEXT ,
        rating      INTEGER
);
-- 'book_author' is a many-to-many join table between books & authors
CREATE TABLE book_author (
        book_id     INTEGER REFERENCES book(id) ON DELETE CASCADE ON UPDATE CASCADE,
        author_id   INTEGER REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (book_id, author_id)
);
CREATE TABLE author (
        id          INTEGER PRIMARY KEY,
        first_name  TEXT,
        last_name   TEXT
);
---
--- Load some sample data
---
INSERT INTO book VALUES (1, 'CCSP SNRS Exam Certification Guide', 5);
INSERT INTO book VALUES (2, 'TCP/IP Illustrated, Volume 1', 5);
INSERT INTO book VALUES (3, 'Internetworking with TCP/IP Vol.1', 4);
INSERT INTO book VALUES (4, 'Perl Cookbook', 5);
INSERT INTO book VALUES (5, 'Designing with Web Standards', 5);
INSERT INTO author VALUES (1, 'Greg', 'Bastien');
INSERT INTO author VALUES (2, 'Sara', 'Nasseh');
INSERT INTO author VALUES (3, 'Christian', 'Degu');
INSERT INTO author VALUES (4, 'Richard', 'Stevens');
INSERT INTO author VALUES (5, 'Douglas', 'Comer');
INSERT INTO author VALUES (6, 'Tom', 'Christiansen');
INSERT INTO author VALUES (7, 'Nathan', 'Torkington');
INSERT INTO author VALUES (8, 'Jeffrey', 'Zeldman');
INSERT INTO book_author VALUES (1, 1);
INSERT INTO book_author VALUES (1, 2);
INSERT INTO book_author VALUES (1, 3);
INSERT INTO book_author VALUES (2, 4);
INSERT INTO book_author VALUES (3, 5);
INSERT INTO book_author VALUES (4, 6);
INSERT INTO book_author VALUES (4, 7);
INSERT INTO book_author VALUES (5, 8);
```

Then use the following command to build a myapp.db SQLite database:

```bash
$ sqlite3 myapp.db < myapp01.sql
```

If you need to create the database more than once, you probably want to issue the rm myapp.db command to delete the database before you use the sqlite3 myapp.db < myapp01.sql command.

Once the myapp.db database file has been created and initialized, you can use the SQLite command line environment to do a quick dump of the database contents:

```
    $ sqlite3 myapp.db
    SQLite version 3.7.3
    Enter ".help" for instructions
    Enter SQL statements terminated with a ";"
    sqlite> select * from book;
    1|CCSP SNRS Exam Certification Guide|5
    2|TCP/IP Illustrated, Volume 1|5
    3|Internetworking with TCP/IP Vol.1|4
    4|Perl Cookbook|5
    5|Designing with Web Standards|5
    sqlite> .q
    $
```

Or:

```
    $ sqlite3 myapp.db "select * from book"
    1|CCSP SNRS Exam Certification Guide|5
    2|TCP/IP Illustrated, Volume 1|5
    3|Internetworking with TCP/IP Vol.1|4
    4|Perl Cookbook|5
    5|Designing with Web Standards|5
```

As with most other SQL tools, if you are using the full "interactive" environment you need to terminate your SQL commands with a ";" (it's not required if you do a single SQL statement on the command line). Use ".q" to exit from SQLite from the SQLite interactive mode and return to your OS command prompt.

For using other databases, such as PostgreSQL or MySQL, see Appendix 2.

### DATABASE ACCESS WITH QtSql

Cutelyst can be used in conjunction with ORMs such as QxORM (http://www.qxorm.com/) or ODB (http://codesynthesis.com/products/odb/), but for the time being we are going to use QtSql and write our own SQL statements. In future we might write appendixes for them, so for now make sure you have QtSql development packages as well as Qt Sqlite3 driver installed. Cutelyst::Sql::Utils will also be used to simplify Sql code.

Before you continue, make sure your myapp.db database file is in the application's topmost directory.

Now we are going to add the required code open the database connection:

First change CMakeLists.txt to find QtSql:

```diff
- find_package(Qt5 COMPONENTS Core Network)
+ find_package(Qt5 COMPONENTS Core Network Sql)
```

Then src/CMakeLists.txt to include and link to QtSql:

```cmake
target_link_libraries(MyApp
    ...
    Qt5::Sql             # Add this line
    Cutelyst::Utils::Sql # Add this line
    ...
}
```

With QtSql we can open a connection to the database once and reuse it for application's lifetime, but it's important to notice that you must not open it before forking a new process, otherwise all child process will share the same connection and the behavior is undefined.

Add the virtual *postFork()* method to your main application class, there you can return false if your database fails to open:

```C++
// myapp.h
public:
   ...
   virtual bool postFork() override;
```

```C++
// myapp.cpp
...
#include <QtSql>
#include <Cutelyst/Plugins/Utils/Sql>
...
bool MyApp::postFork()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE", Sql::databaseNameThread("MyDB"));
    db.setDatabaseName("myapp.db");
    db.setConnectOptions("foreign_keys = ON");
    if (!db.open()) {
        qCritical() << "Failed to open database:" << db.lastError().text();
        return false;
    }
    return true;
}
```

### ENABLE THE MODEL IN THE CONTROLLER

For the time being QtSql or more specifically QSqlQuery doesn't provide any form of introspection, which makes it unusable for QML and Grantlee which require it, because of that we need to read all result and put it into introspectable objects (such as QVariantHash), for that we will use Cutelyst::Utils::Sql

Open src/books.cpp and add the code to fetch the list of books:

```diff
+ #include <QtSql>
+ #include <Cutelyst/Plugins/Utils/Sql>
void Books::list(Context *c)
{
+     QSqlQuery query = CPreparedSqlQueryThreadForDB("SELECT * FROM book", "MyDB");
+     if (query.exec()) {
+         c->setStash("books", Sql::queryToHashList(query));
+     }
-     c->setStash("books", "");
}
```

#### Test Run The Application

Rebuild the application and and see the server restarting.

Some things you should note in the server output:

To view the book list, change the URL in your browser to http://localhost:3000/books/list. You should get a list of the five books loaded by the myapp01.sql script above without any formatting. The rating for each book should appear on each row, but the "Author(s)" column will still be blank (we will fill that in later).

You now have the beginnings of a simple but workable web application. Continue on to future sections and we will develop the application more fully.

### CREATE A WRAPPER FOR THE VIEW

When using Grantlee, you can (and should) create a wrapper that will literally wrap content around each of your templates. This is certainly useful as you have one main source for changing things that will appear across your entire site/application instead of having to edit many individual files.

#### Configure the view in myapp.cpp For The Wrapper

In order to create a wrapper, you must first edit your view object and tell it where to find your wrapper file.

Edit your view in src/myapp.cpp and change it to match the following:

```c++
bool MyApp::init()
{
    ...
    auto view = new GrantleeView(this);
    view->setIncludePaths({ pathTo("root/src") });
    ...
    view->setWrapper("wrapper.html"); // Add this line
    ...
}
```

#### Create the Wrapper Template File and Stylesheet

Next you need to set up your wrapper template. Basically, you'll want to take the overall layout of your site and put it into this file. For the tutorial, open root/src/wrapper.html and input the following:

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" [%#
    %]"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>{{ template }}</title>
<link rel="stylesheet" href="/static/css/main.css" />
</head>

<body>
<div id="outer">
<div id="header">
    {% comment %} Insert the page title {% endcomment %}
    <h1>{{ site.title }}</h1>
</div>
    
<div id="bodyblock">
<div id="menu">
    Navigation:
    <ul>
        <li><a href="/books/list">Home</a></li>
        <li><a href="/" title="Cutelyst Welcome Page">Welcome</a></li>
        </ul>
</div><!-- end menu -->

<div id="content">
    {% comment %} Status and error messages {% endcomment %}
        <span class="message">{{ status_msg }}</span>
        <span class="error">{{ error_msg }}</span>
    {% comment %} This is where Grantlee will stick all of your template's contents.{% endcomment %}
    {{ content }}
</div><!-- end content -->
</div><!-- end bodyblock -->

<div id="footer">Copyright (c) your name goes here</div>
</div><!-- end outer -->

</body>
</html>
```

Notice the status and error message sections in the code above:

```html
    <span class="status">{{ status_msg }}</span>
    <span class="error">{{ error_msg }}</span>
```

If we set either message in the Cutelyst stash (e.g., c->setStash("status_msg", "Request was successful!") it will be displayed whenever any view used by that request is rendered. The message and error CSS styles can be customized to suit your needs in the root/static/css/main.css file we create below.

Notes:

The Cutelyst stash only lasts for a single HTTP request. If you need to retain information across requests you can use Cutelyst::Plugin::Session (we will use Cutelyst sessions in the Authentication chapter of the tutorial).
Although it is beyond the scope of this tutorial, you may wish to use a JavaScript or AJAX tool such as jQuery (http://www.jquery.com) or Dojo (http://www.dojotoolkit.org).

#### Create A Basic Stylesheet

First create a central location for stylesheets under the static directory:

```bash
$ mkdir -p root/static/css
```

Then open the file root/static/css/main.css (the file referenced in the stylesheet href link of our wrapper above) and add the following content:

```css
#header {
    text-align: center;
}
#header h1 {
    margin: 0;
}
#header img {
    float: right;
}
#footer {
    text-align: center;
    font-style: italic;
    padding-top: 20px;
}
#menu {
    font-weight: bold;
    background-color: #ddd;
}
#menu ul {
    list-style: none;
    float: left;
    margin: 0;
    padding: 0 0 50% 5px;
    font-weight: normal;
    background-color: #ddd;
    width: 100px;
}
#content {
    margin-left: 120px;
}
.message {
    color: #390;
}
.error {
    color: #f00;
}
```
    
You may wish to check out a "CSS Framework" like Emastic (http://code.google.com/p/emastic/) as a way to quickly provide lots of high-quality CSS functionality.

#### Test Run The Application

Rebuild and hit "Reload" in your web browser and you should now see a formatted version of our basic book list. (Again, the development server should have automatically restarted when you run make. If you are not using the "-r" option, you will need to hit Ctrl-C and manually restart it. Also note that the development server does NOT need to restart for changes to the Grantlee and static files we created and edited in the root directory -- those updates are handled on a per-request basis.)

Although our wrapper and stylesheet are obviously very simple, you should see how it allows us to control the overall look of an entire website from two central files. To add new pages to the site, just provide a template that fills in the content section of our wrapper template -- the wrapper will provide the overall feel of the page.

### OPTIONAL INFORMATION

NOTE: The rest of this chapter of the tutorial is optional. You can skip to Chapter 4, Basic CRUD, if you wish.

Using 'RenderView' for the Default View

Once your controller logic has processed the request from a user, it forwards processing to your view in order to generate the appropriate response output. Cutelyst uses Cutelyst::Action::RenderView by default to automatically perform this operation. If you look in src/root.h, you should see the empty definition for the sub end method:

```c++
private:
    C_ATTR(End, :ActionClass("RenderView"))
    void End(Context *c) { Q_UNUSED(c); }
```

The following bullet points provide a quick overview of the RenderView process:

Root class is designed to hold application-wide logic.
At the end of a given user request, Cutelyst will call the most specific *End* method that's appropriate. For example, if the controller for a request has an *End* method defined, it will be called. However, if the controller does not define a controller-specific *End* method, the "global" *End* method in Root.h will be called.
Because the definition includes an ActionClass attribute, the Cutelyst::Action::RenderView logic will be executed after any code inside the definition of *End* is run. See Cutelyst::Manual::Actions for more information on ActionClass.
Because *End* is empty, this effectively just runs the default logic in RenderView. However, you can easily extend the RenderView logic by adding your own code inside the empty method body ({}) created by the Cutelyst Helpers when we first ran the cutelst command to initialize our application.

#### Calling the View Renderer directly

When using the *End* action there is no easy way to call different view renderers. For instance you want one action to be rendered through grantlee and another in the same class through the JSON renderer. In this case you need to register both views in the `init()` method but you need to give them unique names passed as the second parameter:

```
bool MyApp::init() {
  new GrantleeView(this, "grantlee_view");
  new ViewJson(this, "json_view");

  return true;
}
```

In the header file you can now decide which renderer to use by setting the `:View` C_ATTR parameter:

```
C_ATTR(index, :Path :Args(0) :ActionClass("RenderView") :View("grantlee_view"))
void index(Context *c);

C_ATTR(entries, :Local :Args(0) :ActionClass("RenderView") :View("json_view"))
void entries(Context *c);
```

#### Using The Default Template Name

By default, Cutelyst::View::Grantlee will look for a template that uses the same name as your controller action, allowing you to save the step of manually specifying the template name in each action. For example, this would allow us to remove the c->setStash("template", "books/list.html"); line of our list action in the Books controller. Open src/books.cpp in your editor and comment out this line to match the following:

```diff
-    c->setStash("template", "books/list.html");
+    // c->setStash("template", "books/list.html");
```

You should now be able to access the http://localhost:3000/books/list URL as before.

NOTE: If you use the default template technique, you will not be able to use either the c->forward or the c->detach mechanisms (these are discussed in Chapter 2 and Chapter 9 of the Tutorial).

IMPORTANT: Make sure that you do not skip the following section before continuing to the next chapter 4 Basic CRUD.

#### Return To A Manually Specified Template

In order to be able to use c->forward() and c->detach() later in the tutorial, you should remove the comment from the statement in the method list in MyApp/src/books.cpp:

```diff
-    // c->setStash("template", "books/list.html");
+    c->setStash("template", "books/list.html");
```

Check the http://localhost:3000/books/list URL in your browser. It should look the same manner as with earlier sections.

You can jump to the next chapter of the tutorial here: [Basic CRUD](Tutorial_04_BasicCRUD)
