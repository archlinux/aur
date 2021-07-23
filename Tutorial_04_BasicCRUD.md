### OVERVIEW

1. [Introduction](Tutorial_01_Intro)
2. [Cutelyst Basics](Tutorial_02_CutelystBasics)
3. [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
4. [Basic CRUD](Tutorial_04_BasicCRUD)
5. [Authentication](Tutorial_05_Authentication)

### INTRODUCTION

This chapter of the tutorial builds on the fairly primitive application created in Chapter 3 to add basic support for Create, Read, Update, and Delete (CRUD) of Book objects. Note that the 'list' function in Chapter 3 already implements the Read portion of CRUD (although Read normally refers to reading a single object; you could implement full Read functionality using the techniques introduced below). This section will focus on the Create and Delete aspects of CRUD. More advanced capabilities, including full Update functionality, will be addressed in Chapter 9.

### FORMLESS SUBMISSION

Our initial attempt at object creation will utilize the "URL arguments" feature of Cutelyst (we will employ the more common form-based submission in the sections that follow).

Include a Create Action in the Books Controller

Edit src/books.h and enter the following method:

```C++
public:
    ...
    /**
     * Create a book with the supplied title, rating, and author
     */
    C_ATTR(url_create, :Local :Args(3))
    void url_create(Context *c, const QString &title, const QString &rating, const QString &authorId);
```

And in src/books.cpp:

```c++
void Books::url_create(Context *c, const QString &title, const QString &rating, const QString &authorId)
{
    // In addition to context, get the title, rating, &
    // author_id args from the URL. Note that Cutelyst automatically
    // puts extra information after the "/<controller_name>/<action_name/"
    // as QStrings.  The args are separated  by the '/' char on the URL.

    // Insert the book into it's table
    QSqlQuery query = CPreparedSqlQueryThreadForDB("INSERT INTO book (title, rating) VALUES (:title, :rating)", "MyDB");
    query.bindValue(":title", title);
    query.bindValue(":rating", rating);
    int bookId = 0;
    bool error = true;
    if (query.exec()) {
        bookId = query.lastInsertId().toInt();

        query = CPreparedSqlQueryThreadForDB("INSERT INTO book_author (book_id, author_id) VALUES (:book_id, :author_id)", "MyDB");
        query.bindValue(":book_id", bookId);
        query.bindValue(":author_id", authorId);
        if (query.exec()) {
            error = false;
        }
    }

    // On error show the last one
    if (error) {
        c->stash()["error_msg"] = query.lastError().text();
    }

    QVariantHash book;
    book["title"] = title;
    book["rating"] = rating;

    // Assign the Book object to the stash for display and set template
    c->stash({
                   {"book", book},
                   {"template", "books/create_done.html"}
               });

    // Disable caching for this page
    c->response()->setHeader("Cache-Control", "no-cache");
}
```

Notice that Cutelyst takes "extra slash-separated information" from the URL and passes it as arguments in (as long as the number of arguments is not "fixed" using an attribute like :Args(0)). The url_create action then makes a SQL insert to add the requested information to the database (with a separate call to update the join table). As do virtually all controller methods (at least the ones that directly handle user input), it then sets the template that should handle this request.

Also note that we are explicitly setting a no-cache "Cache-Control" header to force browsers using the page to get a fresh copy every time. You could even move this to a Auto method in src/Root.cpp and it would automatically get applied to every page in the whole application via a single line of code (remember from Chapter 3, that every auto method gets run in the Controller hierarchy).

Include a Template for the 'url_create' Action:

Edit root/src/books/create_done.html and then enter:

```html
{% comment %} Output information about the record that was added.  First title.{% endcomment %}
<p>Added book '{{ book.title }}'.</p>

<p><a href="/books/list">Return to list</a></p>
```

Try the 'url_create' Feature

Make sure the development server is running with the "-r" restart option and that you rebuild the application with make.

Note that new path for /books/url_create appears in the startup debug output.

Next, use your browser to enter the following URL:

    http://localhost:3000/books/url_create/TCPIP_Illustrated_Vol-2/5/4
Your browser should display "Added book 'TCPIP_Illustrated_Vol-2' by 'Stevens' with a rating of 5.".

If you then click the "Return to list" link, you should find that there are now six books shown (if necessary, Shift+Reload or Ctrl+Reload your browser at the /books/list page).

### CONVERT TO A CHAINED ACTION

Although the example above uses the same Local action type for the method that we saw in the previous chapter of the tutorial, there is an alternate approach that allows us to be more specific while also paving the way for more advanced capabilities. Change the method declaration for url_create in src/books.h you entered above to match the following:

```diff
-    C_ATTR(url_create, :Local :Args(3))
+    C_ATTR(url_create, :Chained("/") :PathPart("books/url_create") :Args(3))
```

This converts the method to take advantage of the Chained action/dispatch type. Chaining lets you have a single URL automatically dispatch to several controller methods, each of which can have precise control over the number of arguments that it will receive. A chain can essentially be thought of having three parts -- a beginning, a middle, and an end. The bullets below summarize the key points behind each of these parts of a chain:

* Beginning
 * Use **:Chained("/")** to start a chain
 * Get arguments through CaptureArgs() or AutoCaptureArgs
 * Specify the path to match with PathPart()
* Middle
 * Link to previous part of the chain with :Chained("_name_")
 * Get arguments through CaptureArgs() or AutoCaptureArgs
 * Specify the path to match with PathPart()
* End
 * Link to previous part of the chain with :Chained("_name_")
 * Do NOT get arguments through "CaptureArgs()," use "Args()" or AutoArgs instead to end a chain
 * Specify the path to match with PathPart()

In our url_create method above, we have combined all three parts into a single method: :Chained("/") to start the chain, :PathPart("books/url_create") to specify the base URL to match, and :Args(3) to capture exactly three arguments and to end the chain.

As we will see shortly, a chain can consist of as many "links" as you wish, with each part capturing some arguments and doing some work along the way. We will continue to use the Chained action type in this chapter of the tutorial and explore slightly more advanced capabilities with the base method and delete feature below. But Chained dispatch is capable of far more.

#### Try the Chained Action

If you look back at the application server startup logs from your initial version of the url_create method (the one using the :Local attribute), you will notice that it produced output similar to the following:

```
Loaded Path actions:
.-----------------------+-------------------.
| Path                  | Private           |
.-----------------------+-------------------.
| /...                  | /defaultPage      |
| /                     | /index            |
| /books                | /books/index      |
| /books/list/...       | /books/list       |
| /books/url_create/... | /books/url_create |
.-----------------------+-------------------.
```

When the application server restarts after our conversion to Chained dispatch, the debug output should change to something along the lines of the following:

```
Loaded Path actions:
.-----------------+--------------.
| Path            | Private      |
.-----------------+--------------.
| /...            | /defaultPage |
| /               | /index       |
| /books          | /books/index |
| /books/list/... | /books/list  |
.-----------------+--------------.

Loaded Chained actions:
.-------------------------+-------------------.
| Path Spec               | Private           |
.-------------------------+-------------------.
| /books/url_create/*/*/* | /books/url_create |
.-------------------------+-------------------.
```

url_create has disappeared from the "Loaded Path actions" section but it now shows up under the newly created "Loaded Chained actions" section. And the "/*/*/*" portion clearly shows our requirement for three arguments.

As with our non-chained version of url_create, use your browser to enter the following URL:

    http://localhost:3000/books/url_create/TCPIP_Illustrated_Vol-2/5/4

You should see the same "Added book 'TCPIP_Illustrated_Vol-2' by 'Stevens' with a rating of 5.". Click the "Return to list" link, and you should find that there are now seven books shown (two copies of TCPIP_Illustrated_Vol-2).

#### Refactor to Use a 'base' Method to Start the Chains

Let's make a quick update to our initial Chained action to show a little more of the power of chaining. First, open src/books.h in your editor and add the following method:

```c++
class Books
{
public:
    /**
     * Can place common logic to start chained dispatch here
     */
    C_ATTR(base, :Chained("/") :PathPart("books") :CaptureArgs(0))
    void base(Context *c);
}
```

And on src/books.cpp:

```c++
void Books::base(Context *c)
{
    // Print a message to the debug log
    qDebug("*** INSIDE BASE METHOD ***");
}
```

Here we print a log message. If your controller always needs a book ID as its first argument, you could have the base method capture that argument (with :CaptureArgs(1)) and use it to pull the book object and leave it in the stash for later parts of your chains to then act upon. Because we have several actions that don't need to retrieve a book (such as the url_create we are working with now), we will instead add that functionality to a common object action shortly.

As for url_create, let's modify it to first dispatch to base. Open up src/books.h and edit the declaration for url_create to match the following:

```c++
-    C_ATTR(url_create, :Chained("/") :PathPart("books/url_create") :Args(3))
+    C_ATTR(url_create, :Chained("base") :PathPart("url_create") :Args(3))
```

Once you rebuild your application, notice that the development server will restart and our "Loaded Chained actions" section will changed slightly:

```
Loaded Chained actions:
.-------------------------+-----------------------.
| Path Spec               | Private               |
.-------------------------+-----------------------.
| /books/url_create/*/*/* | /books/base (0)       |
|                         | => /books/url_create  |
.-------------------------+-----------------------.
```

The "Path Spec" is the same, but now it maps to two Private actions as we would expect. The base method is being triggered by the /books part of the URL. However, the processing then continues to the url_create method because this method "chained" off base and specified :PathPart("url_create") (note that we could have omitted the "PathPart" here because it matches the name of the method, but we will include it to make the logic as explicit as possible).

Once again, enter the following URL into your browser:

    http://localhost:3000/books/url_create/TCPIP_Illustrated_Vol-2/5/4

The same "Added book 'TCPIP_Illustrated_Vol-2' by 'Stevens' with a rating of 5." message and a dump of the new book object should appear. Also notice the extra "INSIDE BASE METHOD" debug message in the development server output from the base method. Click the "Return to list" link, and you should find that there are now eight books shown. (You may have a larger number of books if you repeated any of the "create" actions more than once. Don't worry about it as long as the number of books is appropriate for the number of times you added new books... there should be the original five books added via myapp01.sql plus one additional book for each time you ran one of the url_create variations above.)

### MANUALLY BUILDING A CREATE FORM

Although the url_create action in the previous step does begin to reveal the power and flexibility of Cutelyst, it's obviously not a very realistic example of how users should be expected to enter data. This section begins to address that concern (but just barely, see Chapter 9 for better options for handling web-based forms).

#### Add Method to Display The Form

Edit src/books.h and add the following method:

```c++
class Books : public Controller
{
public:
    ...
    /**
     * Display form to collect information for book to create
     */
    C_ATTR(form_create, :Chained("base") :PathPart("form_create") :Args(0))
    void form_create(Context *c);
};
```
    
```C++
void Books::form_create(Context *c)
{
    // Set the Grantlee Template to use
    c->setStash("template", "books/form_create.html");
}
```

This action simply invokes a view containing a form to create a book.

#### Add a Template for the Form

Open root/src/books/form_create.html in your editor and enter:

```html
<form method="post" action="form_create_do">
<table>
  <tr><td>Title:</td><td><input type="text" name="title"></td></tr>
  <tr><td>Rating:</td><td><input type="text" name="rating"></td></tr>
  <tr><td>Author ID:</td><td><input type="text" name="author_id"></td></tr>
</table>
<input type="submit" name="Submit" value="Submit">
</form>
```

Note that we have specified the target of the form data as form_create_do, the method created in the section that follows.

#### Add a Method to Process Form Values and Update Database

Edit src/books.h and add the following method to save the form information to the database:

```c++
class Books : public Controller
{
public:
    ...
    /**
     * Take information from form and add to database
     */
    C_ATTR(form_create_do, :Chained("base") :PathPart("form_create_do") :Args(0))
    void form_create_do(Context *c);
};
```
    
```c++
void Books::form_create_do(Context *c)
{
    // Retrieve the values from the form
    QString title = c->request()->bodyParam("title", "N/A");
    QString rating = c->request()->bodyParam("rating", "N/A");
    QString authorId = c->request()->bodyParam("author_id", "1");

    // Insert the book into it's table
    QSqlQuery query = CPreparedSqlQueryThreadForDB("INSERT INTO book (title, rating) VALUES (:title, :rating)", "MyDB");
    query.bindValue(":title", title);
    query.bindValue(":rating", rating);
    int bookId = 0;
    bool error = true;
    if (query.exec()) {
        bookId = query.lastInsertId().toInt();

        query = CPreparedSqlQueryThreadForDB("INSERT INTO book_author (book_id, author_id) VALUES (:book_id, :author_id)", "MyDB");
        query.bindValue(":book_id", bookId);
        query.bindValue(":author_id", authorId);
        if (query.exec()) {
            error = false;
        }
    }

    // On error show the last one
    if (error) {
        c->stash()["error_msg"] = query.lastError().text();
    }

    // Assign the Book object to the stash for display and set template
    c->stash({
                   {"book", QVariant::fromValue(c->request()->bodyParams())},
                   {"template", "books/create_done.html"}
               });
}
```

#### Test Out The Form

Notice that the server startup log reflects the two new chained methods that we added:

```
Loaded Chained actions:
.-------------------------+--------------------------.
| Path Spec               | Private                  |
.-------------------------+--------------------------.
| /books/form_create      | /books/base (0)          |
|                         | => /books/form_create    |
| /books/form_create_do   | /books/base (0)          |
|                         | => /books/form_create_do |
| /books/url_create/*/*/* | /books/base (0)          |
|                         | => /books/url_create     |
.-------------------------+--------------------------.
```

Point your browser to http://localhost:3000/books/form_create and enter "TCP/IP Illustrated, Vol 3" for the title, a rating of 5, and an author ID of 4. You should then see the output of the same create_done.html template seen in earlier examples. Finally, click "Return to list" to view the full list of books.

Note: Having the user enter the primary key ID for the author is obviously crude; we will address this concern with a drop-down list and add validation to our forms in Chapter 9.

### A SIMPLE DELETE FEATURE

Turning our attention to the Delete portion of CRUD, this section illustrates some basic techniques that can be used to remove information from the database.

#### Include a Delete Link in the List

Edit root/src/books/list.html and update it to match the following (two sections have changed):
1) the additional `<th>Links</th>` table header, and 2) the four lines `<td>...</td>` for the Delete link near the bottom):

```html
{% comment %}This is a Grantlee comment.{% endcomment %}

{% comment %}Some basic HTML with a loop to display books{% endcomment %}
<table>
<tr><th>Title</th><th>Rating</th><th>Author(s)</th><th>Links</th></tr>
{% comment %}Display each book in a table row{% endcomment %}
{% for book in books %}
  <tr>
    <td>{{ book.title }}</td>
    <td>{{ book.rating }}</td>
    <td></td>
    <td>
      {% comment %} Add a link to delete a book {% endcomment %}
      <a href="/books/id/{{ book.id }}/delete">Delete</a>
    </td>
  </tr>
{% endfor %}
</table>
```

The additional code is obviously designed to add a new column to the right side of the table with a Delete "button" (for simplicity, links will be used instead of full HTML buttons; but, in practice, anything that modifies data should be handled with a form sending a POST request).

**Note:** In practice you should never use a GET request to delete a record -- always use POST for actions that will modify data. We are doing it here for illustrative and simplicity purposes only.

#### Add a Common Method to Retrieve a Book for the Chain

As mentioned earlier, since we have a mixture of actions that operate on a single book ID and others that do not, we should not have `base` capture the book ID, find the corresponding book in the database and save it in the stash for later links in the chain. However, just because that logic does not belong in `base` doesn't mean that we can't create another location to centralize the book lookup code. In our case, we will create a method called object that will store the specific book in the stash. Chains that always operate on a single existing book can chain off this method, but methods such as url_create that don't operate on an existing book can chain directly off base.

To add the object method, edit src/books.h and add the following code:

```c++
class Books : public Controller
{
public:
    ...
    /**
     * Fetch the specified book object based on the book ID and store
     * it in the stash
     */
    C_ATTR(object, :Chained("base") :PathPart("id") :CaptureArgs(1))
    void object(Context *c, const QString &id);
};
```

```c++
void Books::object(Context *c, const QString &id)
{
    // Find the object on the database
    QSqlQuery query = CPreparedSqlQueryThreadForDB("SELECT * FROM book WHERE id = :id", "MyDB");
    query.bindValue(":id", id);
    if (query.exec()) {
        c->setStash("object", Sql::queryToHashObject(query));
    } else {
        // You would probably want to do something like this in a real app:
        // c->detach("/error_404");
    }
    qDebug() << "*** INSIDE OBJECT METHOD for obj id=" << id << " ***";
}
```

Now, any other method that chains off object will automatically have the appropriate book waiting for it in c->stash("object").

#### Add a Delete Action to the Controller

Open src/books.h in your editor and add the following method:

```c++
class Books : public Controller
{
public:
    ...
    /**
     * Fetch the specified book object based on the book ID and store
     * it in the stash
     */
    C_ATTR(delete_obj, :Chained("object") :PathPart("delete") :Args(0))
    void delete_obj(Context *c);
};
```

```c++
void Books::delete_obj(Context *c)
{
    QVariantHash book = c->stash("object").toHash();

    // Delete the object on the database
    QSqlQuery query = CPreparedSqlQueryThreadForDB("DELETE FROM book WHERE id = :id", "MyDB");
    query.bindValue(":id", book.value("id"));
    if (query.exec()) {
        // Set a status message to be displayed at the top of the view
        c->setStash("status_msg", "Book deleted.");
    }

    // Forward to the list action/method in this controller
    c->forward("list");
}
```

This method first deletes the book object saved by the object method.

Then, rather than forwarding to a "delete done" page as we did with the earlier create example, it simply sets the status_msg to display a notification to the user as the normal list view is rendered.

The delete action uses the context forward method to return the user to the book list. The detach method could have also been used. Whereas forward returns to the original action once it is completed, detach does not return. Other than that, the two are equivalent.

#### Try the Delete Feature

Once you save the Books controller, the server should automatically restart. The delete method should now appear in the "Loaded Chained actions" section of the startup debug output:

```
Loaded Chained actions:
.-------------------------+--------------------------.
| Path Spec               | Private                  |
.-------------------------+--------------------------.
| /books/id/*/delete      | /books/base (0)          |
|                         | -> /books/object (1)     |
|                         | => /books/delete_obj     |
| /books/form_create      | /books/base (0)          |
|                         | => /books/form_create    |
| /books/form_create_do   | /books/base (0)          |
|                         | => /books/form_create_do |
| /books/url_create/*/*/* | /books/base (0)          |
|                         | => /books/url_create     |
.-------------------------+--------------------------.
```

Then point your browser to http://localhost:3000/books/list and click the "Delete" link next to the first "TCPIP_Illustrated_Vol-2". A green "Book deleted" status message should display at the top of the page, along with a list of the eight remaining books.

#### Fixing a Dangerous URL

Note the URL in your browser once you have performed the deletion in the prior step -- it is still referencing the delete action:

    http://localhost:3000/books/id/6/delete

What if the user were to press reload with this URL still active? In this case the redundant delete is harmless (although it does generate an exception screen, it doesn't perform any undesirable actions on the application or database), but in other cases this could clearly lead to trouble.

We can improve the logic by converting to a redirect. Unlike c->forward("list") or c->detach("list") that perform a server-side alteration in the flow of processing, a redirect is a client-side mechanism that causes the browser to issue an entirely new request. As a result, the URL in the browser is updated to match the destination of the redirection URL.

To convert the forward used in the previous section to a redirect, open `src/books.cpp` and edit the existing delete_obj method to match:

```c++
void Books::delete_obj(Context *c)
{
    QVariantHash book = c->stash("object").toHash();

    // Delete the object on the database
    QSqlQuery query = CPreparedSqlQueryThreadForDB("DELETE FROM book WHERE id = :id", "MyDB");
    query.bindValue(":id", book.value("id"));
    if (query.exec()) {
        // Set a status message to be displayed at the top of the view
        c->setStash("status_msg", "Book deleted.");
    }

    // Redirect the user back to the list page. Note the use
    // of actionFor as earlier in this section (BasicCRUD)
    c->response()->redirect(c->uriFor(CActionFor("list")));
}
```

#### Try the Delete and Redirect Logic

Point your browser to http://localhost:3000/books/list (don't just hit "Refresh" in your browser since we left the URL in an invalid state in the previous section!) and delete the first copy of the remaining two "TCPIP_Illustrated_Vol-2" books. The URL in your browser should return to the http://localhost:3000/books/list URL, so that is an improvement, but notice that no green "Book deleted" status message is displayed. Because the stash is reset on every request (and a redirect involves a second request), the status_msg is cleared before it can be displayed.

#### Using 'uriFor' to Pass Query Parameters

There are several ways to pass information across a redirect. One option is to use the flash technique that we will see in Chapter 5 of this tutorial; however, here we will pass the information via query parameters on the redirect itself. Open src/books.cpp and update the existing sub delete method to match the following:

```c++
void Books::delete_obj(Context *c)
{
    QVariantHash book = c->stash("object").toHash();
    QString statusMsg;

    // Delete the object on the database
    QSqlQuery query = CPreparedSqlQueryThreadForDB("DELETE FROM book WHERE id = :id", "MyDB");
    query.bindValue(":id", book.value("id"));
    if (query.exec()) {
        // Set a status message to be displayed at the top of the view
        statusMsg = "Book deleted.";
    } else {
        // Set an error message to be displayed at the top of the view
        statusMsg = query.lastError().text();
    }

    // Redirect the user back to the list page. Note the use
    // of actionFor as earlier in this section (BasicCRUD)
    c->response()->redirect(c->uriFor(CActionFor("list"), ParamsMultiMap{
                                {"status_msg", statusMsg }
                            }));
}
```

This modification simply leverages the ability of `uriFor` to include an arbitrary number of name/value pairs in a ParamsMultiMap. Next, we need to update `root/src/wrapper.html` to handle status_msg as a query parameter:

```
...
<div id="content">
    {% comment %} Status and error messages {% endcomment %}
        <span class="message">{{ status_msg }}{{ c.request.queryParams.status_msg|escape }}</span>
        <span class="error">{{ error_msg }}</span>
    {% comment %} This is where Grantlee will stick all of your template's contents.{% endcomment %}
    {{ content }}
</div><!-- end content -->
...
```

Although the sample above only shows the content div, leave the rest of the file intact -- the only change we made to the `wrapper.html` was to add `{{ c.request.queryParams.status_msg|escape }}` to the `<span class="message">` line. Note that we definitely want the `|escape` Grantlee filter here since it would be easy for users to modify the message on the URL and possibly inject harmful code into the application if we left that off, by default Grantlee escapes all strings but if in future you decide to change the default behavior this is in place.

#### Try the Delete and Redirect With Query Param Logic

Point your browser to `http://localhost:3000/books/list` (you should now be able to safely hit "refresh" in your browser). Then delete the remaining copy of "TCPIP_Illustrated_Vol-2". The green "Book deleted" status message should return. But notice that you can now hit the "Reload" button in your browser and it just redisplays the book list (and it correctly shows it without the "Book deleted" message on redisplay).

NOTE: Be sure to check out Authentication where we use an improved technique that is better suited to your real world applications.

You can jump to the next chapter of the tutorial here: [Authentication](Tutorial_05_Authentication)
