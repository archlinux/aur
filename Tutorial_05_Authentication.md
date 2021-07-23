### OVERVIEW

1. [Introduction](Tutorial_01_Intro)
2. [Cutelyst Basics](Tutorial_02_CutelystBasics)
3. [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
4. [Basic CRUD](Tutorial_04_BasicCRUD)
5. [Authentication](Tutorial_05_Authentication)

### DESCRIPTION

Now that we finally have a simple yet functional application, we can focus on providing authentication (with authorization coming next in Chapter 6).

### BASIC AUTHENTICATION

This section explores how to add authentication logic to a Cutelyst application.

#### Add Users and Roles to the Database

First, we add both user and role information to the database (we will add the role information here although it will not be used until the authorization section, Chapter 6). Create a new SQL script file by opening myapp02.sql in your editor and insert:

```sql
--
-- Add users and role tables, along with a many-to-many join table
--
PRAGMA foreign_keys = ON;
CREATE TABLE users (
        id            INTEGER PRIMARY KEY,
        username      TEXT,
        password      TEXT,
        email_address TEXT,
        first_name    TEXT,
        last_name     TEXT,
        active        INTEGER
);
CREATE TABLE role (
        id   INTEGER PRIMARY KEY,
        role TEXT
);
CREATE TABLE user_role (
        user_id INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        role_id INTEGER REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (user_id, role_id)
);
--
-- Load up some initial test data
--
INSERT INTO users VALUES (1, 'test01', 'mypass', 't01@na.com', 'Joe',  'Blow', 1);
INSERT INTO users VALUES (2, 'test02', 'mypass', 't02@na.com', 'Jane', 'Doe',  1);
INSERT INTO users VALUES (3, 'test03', 'mypass', 't03@na.com', 'No',   'Go',   0);
INSERT INTO role VALUES (1, 'user');
INSERT INTO role VALUES (2, 'admin');
INSERT INTO user_role VALUES (1, 1);
INSERT INTO user_role VALUES (1, 2);
INSERT INTO user_role VALUES (2, 1);
INSERT INTO user_role VALUES (3, 1);
```

Then load this into the myapp.db database with the following command:

```bash
$ sqlite3 myapp.db < myapp02.sql
```

#### Include Authentication and Session Plugins

Edit src/CMakeLists.txt and update it as follows:

```cmake
target_link_libraries(MyApp
    ...
    Cutelyst::Session        # Add these lines
    Cutelyst::Authentication # Add these lines
    ...
}
```

#### Create a Authentication Store

Cutelyst comes with a base AuthenticationStore class that can be subclassed to allow for integration with Authentication class, since we are not using an ORM this class will
be used to fetch an user from the database we just changed.

Create a src/authstoresql.h with the following content:

```c++
#ifndef AUTHSTORESQL_H
#define AUTHSTORESQL_H

#include <Cutelyst/Plugins/Authentication/authenticationstore.h>

using namespace Cutelyst;

class AuthStoreSql : public AuthenticationStore
{
public:
    explicit AuthStoreSql(QObject *parent = 0);

    virtual AuthenticationUser findUser(Context *c, const ParamsMultiMap &userinfo) override;

private:
    QString m_idField;
};

#endif // AUTHSTORESQL_H
```

And src/authstore.cpp:

```c++
#include "authstoresql.h"

#include <Cutelyst/Plugins/Utils/Sql>

#include <QSqlQuery>
#include <QSqlRecord>
#include <QSqlError>
#include <QDebug>

AuthStoreSql::AuthStoreSql(QObject *parent) : AuthenticationStore(parent)
{
    m_idField = "username";
}

AuthenticationUser AuthStoreSql::findUser(Context *c, const ParamsMultiMap &userinfo)
{
    QString id = userinfo[m_idField];

    QSqlQuery query = CPreparedSqlQueryThreadForDB("SELECT * FROM users WHERE username = :username", "MyDB");
    query.bindValue(":username", id);
    if (query.exec() && query.next()) {
        QVariant userId = query.value("id");
        qDebug() << "FOUND USER -> " << userId.toInt();
        AuthenticationUser user(userId.toString());

        int columns = query.record().count();
        // send column headers
        QStringList cols;
        for (int j = 0; j < columns; ++j) {
            cols << query.record().fieldName(j);
        }

        for (int j = 0; j < columns; ++j) {
            user.insert(cols.at(j),
                        query.value(j).toString());
        }

        return user;
    }
    qDebug() << query.lastError().text();

    return AuthenticationUser();
}
```

#### Configure Authentication

Edit src/myapp.cpp and update it as follows:

```c++
#include <Cutelyst/Plugins/Session/Session>
#include <Cutelyst/Plugins/Authentication/authentication.h>
#include <Cutelyst/Plugins/Authentication/credentialpassword.h>

#include "authstoresql.h"

bool MyApp::init()
{
    ...
    new Session(this);

    auto auth = new Authentication(this);
    auto credential = new CredentialPassword;
    credential->setPasswordType(CredentialPassword::Clear);
    
    auth->addRealm(new AuthStoreSql, credential);
    ...
}
```

The `Authentication` plugin supports Authentication while the Session plugins are required to maintain state across multiple HTTP requests.

There are different password types. Here we make use of the `CredentialPassword::Clear` since our SQL data is in clear text. On production you want Hashed and in order to obtain a password hash e.g. to store in a database you can use something like

```c++
QByteArray hashedPassword = CredentialPassword::createPassword(         
    password.toUtf8(),
    QCryptographicHash::Sha256,                                         
    3, // iterations
    16, // bytes salt
    16 // bytes hash
);
```

#### Add Login and Logout Controllers

Use the Cutelyst command to create two stub controller files:

```bash
$ cutelyst --controller Login
$ cutelyst --controller Logout
```

You could easily use a single controller here. For example, you could have a User controller with both login and logout actions. Remember, Cutelyst is designed to be very flexible, and leaves such matters up to you, the designer and programmer.

Then open src/login.cpp, and update the definition of the method index to match:

```c++
#include <Cutelyst/Plugins/Authentication/authentication.h>

void Login::index(Context *c)
{
    // Get the username and password from form
    QString username = c->request()->bodyParam("username");
    QString password = c->request()->bodyParam("password");

    // If the username and password values were found in form
    if (!username.isNull() && !password.isNull()) {
        // Attempt to log the user in
        if (Authentication::authenticate(c, { {"username", username}, {"password", password} })) {
            // If successful, then let them use the application
            c->response()->redirect(c->uriFor(c->controller("Books")->actionFor("list")));
            return;
        } else {
            // Set an error message
            c->setStash("error_msg", "Bad username or password.");
        }
    } else if (!Authentication::userExists(c)) {
        // Set an error message
        c->setStash("error_msg", "Empty username or password.");
    }

    // If either of above don't work out, send to the login page
    c->setStash("template", "login.html");
}
```

This controller fetches the username and password values from the login form and attempts to authenticate the user. If successful, it redirects the user to the book list page. If the login fails, the user will stay at the login page and receive an error message. If the username and password values are not present in the form, the user will be taken to the empty login form.

Note that we could have used something like `C_ATTR(index, :Path)`, however, it is generally recommended (partly for historical reasons, and partly for code clarity) only to use an action that matches everything in Root controller of MyApp, and then mainly to generate the 404 not found page for the application.

Instead, we are using `C_ATTR(somename, :Path :Args(0))` here to specifically match the URL /login. Path actions (aka, "literal actions") create URI matches relative to the namespace of the controller where they are defined. Although Path supports arguments that allow relative and absolute paths to be defined, here we use an empty Path definition to match on just the name of the controller itself. The method name, index, is arbitrary. We make the match even more specific with the :Args(0) action modifier -- this forces the match on only /login, not /login/somethingelse.

Next, update the corresponding method in src/logout.cpp to match:

```c++
#include <Cutelyst/Plugins/Authentication/authentication.h>

void Logout::index(Context *c)
{
    // Clear the user's state
    Authentication::logout(c);
    
    // Send the user to the starting point
    c->response()->redirect(c->uriFor("/"));
}
```

#### Include Login and Logout Controllers

Edit src/myapp.cpp and update it as follows:

```c++
#include "login.h"
#include "logout.h"

bool MyApp::init()
{
    ...
    new Login(this);

    new Logout(this);
    ...
}
```

#### Add a Login Form Template Page

Create a login form by opening root/src/login.html and inserting:

```html
<form method="post" action="/login">
  <table>
    <tr>
      <td>Username:</td>
      <td><input type="text" name="username" size="40" /></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><input type="password" name="password" size="40" /></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="submit" value="Submit" /></td>
    </tr>
  </table>
</form>
```

#### Add Valid User Check

We need something that provides enforcement for the authentication mechanism -- a global mechanism that prevents users who have not passed authentication from reaching any pages except the login page. This is generally done via an Auto action/method in src/root.cpp.

Edit the existing src/root.h and src/root.cpp class file and insert the following method:

```c++
class Root : public Controller
{
    ...
private:
    /**
     * Check if there is a user and, if not, forward to login page
     */
    C_ATTR(Auto, :Private)
    bool Auto(Context *c);
};
```

```c++
#include <Cutelyst/Plugins/Authentication/authentication.h>

bool Root::Auto(Context *c)
{
    // Allow unauthenticated users to reach the login page.  This
    // allows unauthenticated users to reach any action in the Login
    // controller.  To lock it down to a single action, we could use:
    //   if (c->action() eq c->controller("Login")->actionFor("index"))
    // to only allow unauthenticated access to the 'index' action we
    // added above
    if (c->controller() == c->controller("Login")) {
        return true;
    }

    // If a user doesn't exist, force login
    if (!Authentication::userExists(c)) {
        // Dump a log message to the development server debug output
        qDebug("***Root::Auto User not found, forwarding to /login");

        // Redirect the user to the login page
        c->response()->redirect(c->uriFor("/login"));

        // Return false to cancel 'post-auto' processing and prevent use of application
        return false;
    }

    // User found, so return true to continue with processing after this 'auto'
    return true;
}
```

As discussed in "CREATE A CUTELYST CONTROLLER" in Cutelyst::Tutorial::03_MoreCutelystBasics, every Auto method from the application/root controller down to the most specific controller will be called. By placing the authentication enforcement code inside the auto method of src/root.cpp, it will be called for every request that is received by the entire application.

#### Try Out Authentication

The development server should have reloaded each time we recompiled the application in the previous section. Now try going to http://localhost:3000/books/list and you should be redirected to the login page, hitting Shift+Reload or Ctrl+Reload if necessary. Note the `***Root::Auto User not found...` debug message in the application server output. Enter username `test01` and password `mypass`, and you should be taken to the Book List page.

IMPORTANT NOTE: If you are having issues with authentication on Internet Explorer (or potentially other browsers), be sure to check the system clocks on both your server and client machines. Internet Explorer is very picky about timestamps for cookies. You can use the `ntpq -p` command to check time sync and/or use the following command to force a sync:

```bash
$ sudo ntpdate-debian
```

Or, depending on your firewall configuration, try it with `-u`:

```bash
    sudo ntpdate-debian -u
```

Note: NTP can be a little more finicky about firewalls because it uses UDP vs. the more common TCP that you see with most Internet protocols. Worse case, you might have to manually set the time on your development box instead of using NTP.
