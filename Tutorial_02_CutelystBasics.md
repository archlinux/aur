### OVERVIEW
1. [Introduction](Tutorial_01_Intro)
2. [Cutelyst Basics](Tutorial_02_CutelystBasics)
3. [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
4. [Basic CRUD](Tutorial_04_BasicCRUD)
5. [Authentication](Tutorial_05_Authentication)

### DESCRIPTION

In this chapter of the tutorial, we will create a very basic Cutelyst web application, demonstrating a number of powerful capabilities, such as:

#### Developer Helper Command
Cutelyst developer helper command that can be used to rapidly bootstrap the skeletal structure of an application.

**MVC**
Model/View/Controller (MVC) provides an architecture that facilitates a clean "separation of control" between the different portions of your application. Given that many other documents cover this subject in detail, MVC will not be discussed in depth here. In short:

**Model**
The model usually represents a data store. In most applications, the model equates to the objects that are created from and saved to your SQL database. Currently Cutelyst doesn't have a clear definition to models, QAbstractItemModel might end up being used to fill this MVC gap.

**View**
The view takes stash / model objects and renders them into something for the end user to look at. Normally this involves a template-generation tool that creates HTML for the user's web browser, but it could easily be code that generates other forms such as PDF documents, e-mails, spreadsheets, or even "behind the scenes" formats such as XML and JSON.

**Controller**
As suggested by its name, the controller takes user requests and routes them to the necessary model and view.


### CREATE A CUTELYST PROJECT

Cutelyst provides a number of options in it's developer command that can be used to quickly flesh out the basic structure of your application.

> If you are using QtCreator it's easier to setup the Cutelyst QtCreator assistant, and create the project there. The command line tool will be used in this tutorial as not everyone like QtCreator (I love it!).

Let's create our first Cutelyst application with cutelyst command to initialize an application called Hello:

```bash
$ cutelyst2 --create-app Hello
 created "Hello"
 created "Hello/src"
 created "Hello/root"
 ...
```

The cutelyst2 helper command will display the names of the directories and files it creates:

    CMakeLists.txt        # CMake file to build application
    src                   # Application main code directory
        CMakeLists.txt    # CMake file with the settings to find your code
        root.cpp          # Sample Root controller implementation
        root.h            # Sample Root controller header
        hello.cpp         # Base application implementation
        hello.h           # Base application header
    root                  # Equiv of htdocs, dir for templates, css, javascript
        static            # Directory for static files

Since Cutelyst is build with C++ and so is your application, you need to first
compile it. To do so make sure you run the following commands:

```bash
$ cd Hello # Get into the application root directory
$ cd build # Get into the out of tree build directory
$ cmake .. # Prepare the project for compilation
$ make     # Compile the application
```

If everything went well and although it's too early for any significant celebration, we almost have a functioning application. We can use the `cutelyst` server to start the application and view the default Cutelyst page in your browser.

Run the following command to start up the application web server:

>Note: The "-r" argument enables reloading your application when you have rebuilt your code so you don't have to stop and start the server every time you make a change and rebuild. Most of the rest of the tutorial will assume that you are using "-r" when you start the server, but feel free to manually start and stop it (use Ctrl-C to breakout of the dev server) if you prefer.

>Note: You can omit the application suffix .so, .dll, .dylib as it will automatically look for the file with the appropriate suffix.

    $ cutelyst2 -r --server --app-file src/libHello -- --chdir ..
    cutelyst.uwsgi[debug] Cutelyst loading application: /home/daniel/code/Hello/build/src/libHello.so
    cutelyst.uwsgi[debug] Loaded application: "Hello"
    cutelyst.dispatcher[debug] 
    Loaded Private actions:
    .--------------+-------+-------------.
    | Private      | Class | Method      |
    .--------------+-------+-------------.
    | /End         | Root  | End         |
    | /defaultPage | Root  | defaultPage |
    | /index       | Root  | index       |
    .--------------+-------+-------------.
    
    Loaded Path actions:
    .------+--------------.
    | Path | Private      |
    .------+--------------.
    | /... | /defaultPage |
    | /    | /index       |
    .------+--------------.

Point your web browser to http://localhost:3000 (substituting a different hostname or IP address as appropriate) and you should be greeted by the Cutelyst welcome screen (if you get some other welcome screen or an "Index" screen, you probably forgot to specify port 3000 in your URL). Information similar to the following should be appended to the logging output of the development server:

    cutelyst.request: "GET" request for "/" from "::1"
    cutelyst.dispatcher: Path is "/"
    cutelyst.stats: Response Code: 200; Content-Type: text/html; charset=utf-8; Content-Length: 20
    cutelyst.stats: Request took: 0.000001s (1000000.000/s)

Note: Press Ctrl-C to break out of the development server if necessary.

### HELLO WORLD

The Simplest Way

The Root.h controller is a place to put global actions that usually execute on the root URL. Open the src/Root.h  and src/Root.cpp files in your editor. You will see the "index" method, which is responsible for displaying the welcome screen that you just saw in your browser.

```c++
class Root : public Controller
{
    ...
    // Root.h
    C_ATTR(index, :Path :AutoArgs)
    void index(Context *c);
    ...
};
```

```c++
// Root.cpp
void Root::index(Context *c)
{
    c->response()->body() = "Welcome to Cutelyst!";
}
```

Later on you'll want to change that to something more reasonable, such as a "404" message or a redirect, but for now just leave it alone.

The "c" here refers to the Cutelyst::Context, which is used to access the Cutelyst application. In addition to many other things, the Cutelyst context provides access to "response" and "request" objects. (See Cutelyst::Context, Cutelyst::Response, and Cutelyst::Request)

c->response()->body() sets the HTTP response (see Cutelyst::Response) with the provided string.

The `:Path :AutoArgs` in the `C_ATTR` macro are attributes which determine which URLs will be dispatched to this method.

Some MVC frameworks handle dispatching in a central place. Cutelyst, by policy, prefers to handle URL dispatching with attributes on controller methods. There is a lot of flexibility in specifying which URLs to match. This particular method will match all URLs, because it doesn't specify the path (nothing comes after "Path"), but will only accept a URL without any args because of the ":AutoArgs" attribute that will count how many QString parameters exist in the method's signature.

The default is to map URLs to controller names, it is simple to create hierarchical structures in Cutelyst by using the C_NAMESPACE macro.

While you leave the `cutelyst -r` command running the application server in one window (don't forget the "-r" option!), open another window and add the following subroutine to your src/Root.h file:

```c++
class Root : public Controller
{
    ...
    C_ATTR(hello, :Global :AutoArgs)
    void hello(Context *c) {
        c->response()->body() = "Hello, World!";
    }
    ...
};
```

NOTE: It's recommended to keep the implementation of the methods in the cpp file, this avoids recompiling other parts of your code that include this header, we keep it in the header here for brevity.

Run make again and notice in the window running the application Server that you should get output similar to the following:
    
    Attempting to restart the server
    ...
    Loaded Private actions:
    .--------------+-------+-------------.
    | Private      | Class | Method      |
    .--------------+-------+-------------.
    | /End         | Root  | End         |
    | /defaultPage | Root  | defaultPage |
    | /hello       | Root  | hello       |
    | /index       | Root  | index       |
    .--------------+-------+-------------.
    ...
The development server noticed the change in `...libHello.so` and automatically restarted itself.

Go to http://localhost:3000/hello to see "Hello, World!". Also notice that the newly defined 'hello' action is listed under "Loaded Private actions" in the development server debug output.

### Hello, World! Using a View and a Template

In the Cutelyst world a "View" itself is not a page of XHTML or a template designed to present a page to a browser. Rather, it is the module that determines the type of view -- HTML, PDF, XML, etc. For the thing that generates the content of that view (such as a Grantlee template file), the actual templates go under the "root" directory.

To create a Grantlee view, add to src/hello.cpp:

```c++
...
#include <Cutelyst/Plugins/View/Grantlee/grantleeview.h>
...
bool Hello::init()
{
    ...
    new GrantleeView(this);
    ...
}
```

And link to it, src/CMakeLists.txt:

```cmake
target_link_libraries(Hello
    ...
    Cutelyst::View::Grantlee # Add this line
    ...
}
```

Now that the View exists, Cutelyst will be able to use it to display the view templates using the "process" method that it inherits from the Cutelyst::View class.

Grantlee is a very full-featured template facility, with excellent documentation at http://www.grantlee.org, but since this is not a Grantlee tutorial, we'll stick to only basic usage here (and explore some of the more common Grantlee features in later chapters of the tutorial).

Create a root/hello.html template file (put it in the root under the Hello directory that is the base of your application). Here is a simple sample:

```html
<p>
    This is a Grantlee view template, called '{{ template }}'.
</p>
```
{{ and }} are markers for the Grantlee parts of the template. Inside you can access Cutelyst variables and classes, and use Grantlee directives. In this case, we're using a special Cutelyst variable that defines the name of the template file (hello.html). The rest of the template is normal HTML.

Change the hello method in src/root.h to the following:

```c++
C_ATTR(hello, :Global)
void hello(Context *c) {
    c->setStash("template", "hello.html");
}
```

This time, instead of doing c->response()->body(), you are setting the value of the "template" hash key in the Cutelyst "stash", an area for putting information to share with other parts of your application. The "template" key determines which template will be displayed at the end of the request cycle. Cutelyst controllers can have an "End" action, which is called after all methods, and together with RenderView action class causes the nameless view to be rendered (unless there's a body explicitly set with c->response()->body() or a named view set with c->setView()). So your template will be magically displayed at the end of your method.

After saving the file and issuing make, the development server should automatically restart (again, the tutorial is written to assume that you are using the "-r" option -- manually restart it if you aren't), and look at http://localhost:3000/hello in your web browser again. You should see the template that you just created.

### CREATE A SIMPLE CONTROLLER AND AN ACTION

Create a controller named "Site" by executing the cutelyst command:

    $ cutelyst2 --controller Site
This will create a src/site.cpp and src/site.h files. If you bring site.h up in your editor, you can see that there's not much there to see.

We now need to register this controller (unfortunately C++/Qt's introspection has it's limitations), so in src/hello.cpp add:

```c++
....
#include "site.h"
....
bool Hello::init()
{
    ....
    new Site(this);
    ....
}
```

In src/site.h, add the following method:

```c++
    C_ATTR(test, :Local)
    void test(Context *c) {
        c->stash({
                     {"username", "John"},
                     {"template", "site/test.html"}
                 });
    }
```

Notice the "Local" attribute on the test method. This will cause the test action (now that we have assigned an "action type" to the method it appears as a "controller action" to Cutelyst) to be executed on the "controller/method" URL, or, in this case, "site/test". We will see additional information on controller actions throughout the rest of the tutorial, but if you are curious take a look at "Actions" in Cutelyst::Action API.

It's not actually necessary to set the template value as we do here. By default Grantlee will attempt to render a template that follows the naming pattern "controller/method.html", and we're following that pattern here. However, in other situations you will need to specify the template (such as if you've "forwarded" to the method, or if it doesn't follow the default naming convention).

We've also put the variable "username" into the stash, for use in the template.

Make a subdirectory "site" in the "root" directory.

    $ mkdir root/site
Create a new template file in that directory named root/site/test.html and include a line like:

```html
<p>Hello, {{ username }}!</p>
```

Rebuild, and once the server automatically restarts, notice in the server output that /site/test is listed in the Loaded Path actions. Go to http://localhost:3000/site/test in your browser and you should see your test.html file displayed, including the name "John" that you set in the controller.

You can jump to the next chapter of the tutorial here: [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
