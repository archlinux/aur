### OVERVIEW
1. [Introduction](Tutorial_01_Intro)
2. [Cutelyst Basics](Tutorial_02_CutelystBasics)
3. [More Cutelyst Basics](Tutorial_03_MoreCutelystBasics)
4. [Basic CRUD](Tutorial_04_BasicCRUD)
5. [Authentication](Tutorial_05_Authentication)

### INTRODUCTION

This tutorial is an adaptation of the great Catalyst Tutorial to match what we currently have in Cutelyst.

### DESCRIPTION

This tutorial provides a multi-part introduction to the Cutelyst Web Framework. It seeks to provide a rapid overview of many of its most commonly used features. The focus is on the real-world best practices required in the construction of nearly all Cutelyst applications.

Although the primary target of the tutorial is users new to the Cutelyst framework, experienced users may wish to review specific sections (for example, how to add authentication and authorization to an existing application).

[Download the tutorial source code](https://github.com/cutelyst/cutelyst-tutorial)

These reference implementations are provided so that when you follow the tutorial, you can use the code to ensure that your system is set up correctly,  and that you have not inadvertently made any typographic errors, or accidentally skipped part of the tutorial.

> NOTE: Cutelyst can run on any OS supported by Qt, you only need to pay attention to minimum Qt version required. It should make little or no difference to Cutelyst's operation, but this tutorial has been written using the Debian-based Tanglu OS.

#### Subjects covered by the tutorial include:

* A simple application that lists and adds books.
* How to write CRUD (Create, Read, Update, and Delete) operations in Cutelyst.
* Authentication ("auth").
* Role-based authorization ("authz").
* Attempts to provide an example showing current Cutelyst practices.
* The use of Grantlee Template (Django).
* Useful techniques for troubleshooting and debugging Cutelyst applications.
* The use of SQLite as a database.

This tutorial makes the learning process its main priority. For example, the level of comments in the code found here would likely be considered excessive in a "normal project." Because of their contextual value, this tutorial will generally favor inline comments over a separate discussion in the text. It also deliberately tries to demonstrate multiple approaches to various features (in general, you should try to be as consistent as possible with your own production code).

Furthermore, this tutorial tries to minimize the number of controllers, templates, and database tables. Although this does result in things being a bit contrived at times, the concepts should be applicable to more complex environments.

### VERSIONS AND CONVENTIONS USED IN THIS TUTORIAL

This tutorial was built using the following resources. Please note that you may need to make adjustments for different environments and versions:

* Ubuntu 17.10
* Cutelyst 2.1.0
* Qt 5.6
* Grantlee 5.0
* SQLite 3

> uWSGI can also be used by replacing `cutelyst-wsgi2` with `uwsgi` and loading the cutelyst plugin, Cutelyst-WSGI supports HTTP, HTTPS and FastCGI while being faster, using less memory, and supporting HTTP keep-alive and pipelining), which is enough for production and development even on embedded hardware. 

### DATABASES

This tutorial will primarily focus on SQLite because of its simplicity of installation and use; however, modifications in the script required to support MySQL and PostgreSQL will be presented in the Appendix.

You can jump to the next chapter of the tutorial here: [Cutelyst Basics](Tutorial_02_CutelystBasics)