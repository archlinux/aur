[ From http://ttakt.chaps.cz/TTAktual/Win/Zip/IWIN.ZIP, extracted on 2016-09-04, copyrighted by CHAPS spol. s r.o. ]
[ translated by translate.google.com on 2016-09-04. ]

=========
* Content *
=========

A. Introduction
B. Browser and timetables
  1. Installation
     a) Single computer
     b) Network
     c) Notes
  2. Characteristics
     a) The basic features of the application
     b) Information on timetables
     c) Starting timetables
     d) Windows applications are opened
     e) Connection Window
     f) The window arrivals / departures
     g) Window Joints
     h) Window timetables for individual stops
  3rd Tips
  4. The uninstallation
C. Updating data
D. Contacts


===========
* A. Introduction *
===========

Product IDOS set is designated for searching the connection and other information
timetables (RP) of different types of transport. IDOS consists of browsers
(File TT.exe) RP data (files with the extension * .tt) and extension modules:

  - Message Boards.

Part of the data files can be:

  - Map data (files with the extension TTM)
  - Tariff information (files with the extension TTP)
  - Additional information (files with the extensions HTM, JPG, GIF, etc.).


==============================
* B. Browser and timetables *
==============================

1. Installation
============

The procedure varies depending on whether the installation
on a single computer or a network install.

a) Single computer
---------------------

 1. Run the installer (SETUP.EXE on the installation media in the \ Setup).
 The second installer displays the license agreement to operate the purchased
    software. If you do not agree with the arrangement, do not proceed with the installation.
 3. Next, select the target folder.
 4. During installation, enter the product registration number.
 5. Then select timetables or other items that will be installed.
 6. In the next step of the installation, choose whether you want to:
      - Create shortcuts to installed RP desktop
      - Create a shortcut to the selection of RP in the Quick Launch toolbar
      - Create a file type association * .tt browser and timetables
 7. In conclusion plugin installation installer prompts you to open the file
    ReadMe.txt with basic information on the software and the possible
    the program starts (starts with the selection of timetables).

    On the Start menu and on the desktop (if elected) representatives will be created
    Only the following installed RP:
      - Trains,
      - Buses CR
      - Buses SR,
      - Brno - Integrated Transport System of the South Moravian Region,
      - Czech Budejovice - Czech Budejovice public transport,
      - Hradec Kralove - MHD Hradec Kralove
      - Jihlava - MHD Jihlava
      - Karlovy Vary - MHD Karlovy Vary
      - Liberec - MHD Liberec,
      - Olomouc - Olomouc public transportation,
      - Ostrava - Ostrava public transport,
      - Pardubice - Pardubice Transportation
      - Pilsen - Pilsen public transport,
      - Prague - Prague Integrated Transport,
      - Usti nad Labem - MHD Usti nad Labem
      - Zlin and Otrokovice - public transport Zlin and Otrokovice
      - Timetable,
      - Trains and Buses
      - Trains and buses + MHD Brno, Ostrava, Prague
      - IDOS - timetables choice.
    In the Quick Launch toolbar will only create a shortcut for selecting timetables.

b) Network
------

 1. The file is an installer (setup.exe) copy on a shared disk server.
 2. From the server or from a client, run the installer (Setup.exe).
 3. The installer displays the license agreement to operate the purchased
    software. If you do not agree with the arrangement, do not proceed with the installation.
 4. Next, select the destination folder.
 5. During installation, enter the product registration number.
 6. Then select timetables or other items that will be installed.
 7. In the next step of the installation, choose whether you want to:
      - Create shortcuts to installed RP desktop
      - Create a shortcut to the selection of RP in the Quick Launch toolbar
      - Create a file type association * .tt browser and timetables
 8. In conclusion plugin installation installer prompts you to open the file
    ReadMe.txt with basic information on the software and the possible
    the program starts (starts with the selection of timetables).
   
    On the Start menu and on the desktop (if elected) representatives will be created
    Only the following installed RP:
      - Trains,
      - Buses CR
      - Buses SR,
      - Brno - Integrated Transport System of the South Moravian Region,
      - Czech Budejovice - Czech Budejovice public transport,
      - Hradec Kralove - MHD Hradec Kralove
      - Jihlava - MHD Jihlava
      - Karlovy Vary - MHD Karlovy Vary
      - Liberec - MHD Liberec,
      - Olomouc - Olomouc public transportation,
      - Ostrava - Ostrava public transport,
      - Pardubice - Pardubice Transportation
      - Pilsen - Pilsen public transport,
      - Prague - Prague Integrated Transport,
      - Usti nad Labem - MHD Usti nad Labem
      - Zlin and Otrokovice - public transport Zlin and Otrokovice
      - Timetable,
      - Trains and Buses
      - Trains and buses + MHD Brno, Ostrava, Prague
      - IDOS - timetables choice.
    In the Quick Launch toolbar will only create a shortcut for selecting timetables.
 9. If the installation was carried out from a client installer creates a
    program directory setup.exe to install dose SetupNet.bat
    Representatives of the other stations in the network. If the installation is carried out
    directly on the server, you must manually create this dose. She should
    Call contain Setup.exe with the path to the installed RP
    as a parameter of the program, for example.
    \\ Server \ Install \ IDOS \ setup.exe \\ Server \ Applications \ IDOS.
10. For installation on client computers gradually each
    station in the network run batch SetupNet.bat (paragraph 9). In this case
    installer requires the user only confirm the creation of Representatives
    Desktop and Quick Launch toolbar. Besides the representatives of the installer
    trying to install a font and Timetable.

c) Notes
-----------

- The network can only install the network version of the product.

- All application files are installed into a specified target directory
  and its subdirectories. Browser timetables requires an operating system
  Windows 2000 or higher. On older operating systems installer
  installs an older version, but is no longer being maintained (some
  things in it will not work properly - eg. display of prices). older versions
  applications requires a system Comctl32.dll version of at least 4.71.
  Comctl32.dll installer will not install.

- In case of delivery IDOS (Windows platform) on CD-ROM, you can run a browser
  directly on CD-ROM from the \ IDOS. Only if installed on the computer
  older operating system than Windows 2000, there is no direct browser start possible
  (See. Preceding note).

- In case of delivery IDOS via the Internet (only contains the installer
  RP train and bus services), data can be further JŘ be obtained from the address
  http://www.chaps.cz/cs/download/idos. Installation Procedure (resp. Update)
  other files is described on the relevant website.

- If you already have installed on your computer IDOS previous version,
  enter again the same target directory. The installer modifies existing key registaační
  (File TT.TTK), so they went to introduce old and new timetables.

- If your network consists of a system Novell Netware, it may in some
  network stations lead to the error message "Error 27". In that case
  send us your address idos@chaps.cz file a registration key
  (File TT.TTK - located in the application directory) and we'll appeal
  file that solves the problem.


2. Characteristics
=============

a) The basic features of the application
-------------------------------

IDOS allows you to:

- Work with timetables of trains, buses, public transportation and schedules
- Upload one or more of the RP simultaneously, while RP connect automatically, ie. that
  You can search for connections with simultaneous connections using several different RP
- Search for the optimal connection with transfers while respecting time
  restrictions on driving joints
- Search for the next / previous links, back links,
  connection with a later departure from the transfer point
- Obtain information on arrivals / departures boards
- To obtain detailed information about connections
- Print information to the printer and to a file on disk
- At the same time open up the three windows to find a connection, three windows
  for arrivals / departures, three windows with a list of links and three windows
  to stop RP
- Other functions.

b) Information on timetables
------------------------------

For comfortable work, each RP, one or more lists of objects,
which can then serve as starting and ending points for the search and connection
Listings arrival / departure. For example, it may be lists of towns and villages
(RP trains and buses), bus stops and streets (MHD), and the like.

Bus stops are named according to the convention, which divides
the name of the station into three parts, separated by commas. The first part indicates the name of the village,
the second part indicates the name of the village and the third part is the local designation stops
(Eg. Prague, the White Mountain, White Lamb). Middle or last part of the title can
missing (eg. ,, Praha Radlická METRO). List of municipalities and villages contained
JR respects this fact. So choosing the municipality Praha admit
all the stops to have a comma before the first municipality in Prague. If you select part
Prague municipality, admit all the stops to have a comma before the first
Prague municipality, while the middle part of the name of the stop is empty
(It's a sort of "internal" Prague). The list of municipalities can be found
eg. a part of the municipality of Prague, the White Mountain (includes stops in Prague, Bila Hora
Prague, the White Mountain, White Lamb), for easier searching, this part of town
appears on the list again as the White Mountain / Prague.

Train stations are assigned to municipalities and parts of municipalities according to their cadastral
belonging to the municipalities or parts of municipalities.

The names of municipalities in brackets written out MPZ states and districts license plate.
By default, the better to distinguish written out license plates and MPZ only foreign
towns and villages or resolution in the towns and villages of the same names.

If several loads simultaneously timetables of trains, buses or public transportation, JR
automatically connect and can work with them as a single RP.

E.g. if they are loaded simultaneously RP:

  - Trains 2009/2010 and 2009/2010 Coaches can search for connections that
    They comprise transfers from trains, buses, and vice versa, forming a single common
    List of cities and municipalities for entering starting and destination points of connection, etc.

  - Trains Trains 2008/2009 and 2009/2010 can be sought simultaneously by connection
    both old and new train traffic (one connection can be
    used trains of old and new timetable).

c) Application Startup
---------------------

IDOS work with the application to begin running the program TT.exe. as a parameter
Program can enter names (including the path) of one or more RP
(Files with the extension * .tt) to be loaded. If the file name
JR entered, the application searches for available RP and if it is available
one leads him straight. If there is more available RP, gives the program
offer. Application installer creates a shortcut to some (most important) of installed
RP automatically.

Other parameters affecting the program window that opens first when the program starts:

  / W: c Connections window opens (default)
  / W: to open the window the arrival / departure
  / W: t window opens Joints
  / W: the window opens timetables for individual stops

Listing all the starting parameters of the program, get typing "TT.exe /?".

d) Windows applications are opened
--------------------------

IDOS works with these basic types of windows:

- Links
- Arrivals / departures
- joints
- Timetables for individual stops (only available for RP MHD).

Working with windows application follows these basic rules:

- Any type of parent windows can be opened up to 3 times; it allows
  simultaneously search and compare the various connections, departures from various
  buildings, etc.
- When switching between windows is helpful context menus,
  caused by right-clicking.
- Options to search for the connection can be set independently for each window.
- Other menu options (method of formatting of date notes, color
  joints, etc.) are global and affect all windows of the program.
- Header window always expresses brief information about the content of the window
  where applicable, the names used by the RP.
- Under the header, menus and toolbars that are individualized for
  each window. The toolbar can be hidden, including descriptive view
  texts for feature icons or descriptive text to hide.
- Ongoing help and status information is displayed on the status
  Line the bottom of the window.
- The application is terminated by closing all windows, or Exit menu
  File.

e) Connection Window
---------------

The window is designed to search for direct connection and connection with transfers.

In the combination is entered:

- Default object path (Z)
- The target object path (Do)
- An object through which the connection browse the search (Via)
- The travel date (Date)
- The desired time of departure from the default object (departure time) or
- Required time of arrival to the target object (Time of Arrival).

Default target object, and through them you can enter:

- Setting the cursor to some of the items from, to, Via, a panel
  preferences with selection lists of objects (municipalities, cities and parts
  municipalities, etc.). Select the type of feature, and then typujte letters
  its name. When typing characters will override the preset list names
  first nine objects which match the mask. When the
  panel display object of the search, it can put its numerical choice
  or click of a mouse
- Setting the cursor to the appropriate item and the installation of presets
- From the menu using the Edit / Settings Z or Edit / Settings or to
  Edit / Settings Over. In the dialog that appears after the election is
  You must first select the type (List) the search object, then the rating
  mask his name.

Date of departure / arrival is entered:

- Entering data into the Date
- Display a calendar from the View menu / Calendar and selecting data
  or by category on the tab Day. The date is only possible to
  the period of validity of the RP.

Time of departure / arrival:
- The format is always one of the times
- Seeking either trips departing after a specified time or arrival time at the
  specified time.

The required connections are searched by pressing the Search key (F2).
The method for finding the connection is influenced by many parameters,
which are set in the Options dialog box. Information on individual parameters
best to get the application context help (F1 key).

The list of searched connections arranged in ascending order according to departure times
(If the specified time-out) or arrival times (if it was specified time
arrival), appears in the middle of the window connection. The looked-up
connection to find time following connection using the Find / Next
connection time prior connection using Search / Previous links.
Previous and next links in the list of union ranks in time for
the right place.

To connect as a whole and for individual connections at the bottom of the window
written out notes. Color icons differentiates these types of notes:

- purple
  - Starting and ending stop connections with times of departure and arrival
- red
  - The time limit for driving connection / connections
- green
  - The name of the line carrier
- blue
  - Information note.

A list of links can be displayed in three levels of detail.
The first level shows the name of departure and destination stops with the times
departure, arrival, with a total time and length of the journey and the list
used types of joints. On the second level are additionally provided transfer
Transfer stations and times. On the third level is displayed continuous route
connections with the times. For switching of connections in the connection list of the first
the second level serves option View / connection / Extended format
connection (Ctrl + Plus, Ctrl + right arrow) to switch from the second to the first
Level option View / link / connection Basic format
(Ctrl + Minus, Ctrl + left arrow). To switch to one connection of the first
the second and third levels serve the Show / Connection / Advanced
format combination (plus, right arrow), for switching from third to second
and the first level of the Show / Connections / connection Basic format
(Minus, left arrow).

To find your way back is possible to use the option to interchange
initial and target object from the Edit menu / Exchanges and Do. Finding
way back it is also possible by selecting Way back contextual menu
(Right click on a link). In this case the connection
retrieves and displays in a new window. Context menu in addition to other more
lets find a connection with a later departure at a transfer stop,
possibly set another transfer station, in the case of concurrent connections.

In the list of connection options you can use the Edit / Mark connection mark
connection for printing, and then use the File / Print to print some of these
ways:

- A printer in graphics mode Windows
- A printer in character mode
- File in txt, rtf and html.

f) The window arrivals / departures
------------------------

The window is intended for displaying arrival / departure from / to the selected object
direct connection between the two objects, one for RP. In case the
more available RP, switching between them serves option File / Bikes
order.

On the arrival / departure is entered:

- Default object (Z)
- The target object (Do)
- Date (date).

To enter items the same rules as for the items in the window
Connection. The list of departures / arrivals is obtained by pressing the Search button.
Depending on which of the items Out / In are filled, shows:

- Z: filled, to: unlisted:
      • a list of sailings
- Z: unlisted Do: filled:
      • List arrivals
- Z: filled, to: filled:
      • a list of direct links, the choice of the Search / Arrivals
        either displayed departures from object to object to Z or
        arrivals to object to the object Z.

The lists are arranged in ascending order according to the time of departure / arrival of
Default / target object. The lists can be searched joints
by numbers or names. Selecting Search / Options can be
disable / enable the category of connections that are in the lists are displayed.
List of arrival / departure is possible by selecting File / Print to print.

g) Window Joints
-------------

The window is intended to display a list of all the connections of one of the RP. IN
if there are more RP, switching between them is used option
File / timetable. You can join by selecting Search / Search Search
by number and title. Selecting Search / Options can disable / enable
category links that appear in the list. The joint, which is
cursor, you can use the option File / Print to print.

h) Window timetables for individual stops
------------------------------

The window is available only for public transport timetables. In the event that there is more of the RP,
to switch between them serves option File / timetable.

In the individual stops timetables is entered:

- line
- date
- Direction (upward trend depends on a given route and date).

After pressing the search are displayed in the left part of the list of stops
traversed the line in that direction. The list is set to stop that
is found on the preset list (in order of 1-9), in the absence
No, it is set at the first stop on the list. On the right side, then
displays departure times arranged by the hour from 0 to 23. In the list
notes appearing explanations of abbreviations used at stops
(Purple icons) and departure times at the (blue icons).


3rd Tips
=======

a) Change the list to select an object from the keyboard
-----------------------------------------------

If RP contain multiple lists (object types) is necessary before choosing
Building From / To / Through the set list from which we select. it can be
set the mouse or the keyboard shortcut Ctrl-PgUp and Ctrl-PgDn.

b) Entering masks to find the object
--------------------------------------

When entering a mask, you can proceed in several ways:

- Entering the beginning of the object name,
  eg. the guise of "threshold" suits "Praha, Běchovice"
- Entering the beginning of words in the title (this method is most effective)
  eg. the guise of "f u p" suits "Prague ,, Florenc UAN"
- Typing the text contained in the title (at the beginning of the mask type an asterisk)
  eg. the mask "* Praded" suits "Rudná p.Pradědem".

When comparing the mask with the name of the search object to distinguish
between uppercase and lowercase letters. If the mask contains diacritical
signs (punctuation), with respect, otherwise when comparing
ignores accents,
eg. the guise of "troy" suits "Kosice" and "troy"
      mask "troy" only meets "Košice".

The preferences pane automatically displays the first nine objects
called satisfactory mask. If you want to see other buildings
Use the convenient guise PgDn, PgUp then return
to the previous menu.

c) use presets
----------------------

The application offers the possibility to define up to nine presets numbered
digits 1 to 9 preferences may be objects of type city (eg. Praha)
part of the city (eg. Ostrava, Hrabůvka), stations (eg. Prague Main) ap.

When creating presets can proceed in several ways:

- Selecting the menu Edit / Preferences
- Achieving a desired object to Z, into or through a subsequent
  right-clicking on the position preferences panel to
  we want to put code
- Fastest inserting the desired object to Z, into or through a
  then clicking the mouse down the CTRL key to position
  preference panel to which you want to install code.

d) The identification of objects accessible by train and bus
-------------------------------------------------- -

If they are introduced simultaneously timetables of trains and buses, appear
at municipalities and municipal signs that indicate the availability of train
and bus service. For train traffic square is used for
shuttle wheel.

e) Object Settings
--------------------

Objects of type town or district typically contain several train
stations and bus stations. If such an object is used as
starting point for finding the connection, the connection can be in any lineup
stop in this village. If you want to see the stops included
in the building, use the Edit / Object Settings (Ctrl-I), which
clearly displays included stops broken down according to the RP.
Stops are displayed in order of priority use for connection
(Stops are favored above). At this point you also
the possibility of a waypoint in the building disable. For example, if
in Prague disable train station Praha Masarykovo n., then
at the junction of the city of Prague will never depart from this station.
This setting is in common to all open windows and
for the next run the application shall not be retained.

f) Shortcuts applicable to the connection list
--------------------------------------------------

+ ----------------------------------------- + ------- ----------------------------- +
| Show extended format connection | Plus or Right Arrow |
+ ----------------------------------------- + ------- ----------------------------- +
| View basic format of connection | Left Arrow or minus |
+ ----------------------------------------- + ------- ----------------------------- +
| Show extended format | Ctrl + Plus or Ctrl + Right Arrow |
| for all links found | |
+ ----------------------------------------- + ------- ----------------------------- +
| View the basic format | Ctrl + Minus or Ctrl + Left Arrow |
| for all links found | |
+ ----------------------------------------- + ------- ----------------------------- +
| Switch between basic expanded | Enter |
| the format of one connection | |
+ ----------------------------------------- + ------- ----------------------------- +
| Switch between basic expanded | Ctrl + Enter |
| the format of connection | |
+ ----------------------------------------- + ------- ----------------------------- +
| Move across rows | Down Arrow or Up Arrow |
+ ----------------------------------------- + ------- ----------------------------- +
| Move to the next connection | Ctrl + Down Arrow |
+ ----------------------------------------- + ------- ----------------------------- +
| Move to the previous link | Ctrl + Up Arrow |
+ ----------------------------------------- + ------- ----------------------------- +
| Mark (deselect) connection | gap |
| Print | |
+ ----------------------------------------- + ------- ----------------------------- +
| Mark (deselect) all | Ctrl + Space |
| connection for printing | |
+ ----------------------------------------- + ------- ----------------------------- +
| Clear connections from the list | Delete |
+ ----------------------------------------- + ------- ----------------------------- +
| Lock (Cancel Lock) connection | Insert |
+ ----------------------------------------- + ------- ----------------------------- +
| Lock (lock cancel) all connections | Ctr + Insert |
+ ----------------------------------------- + ------- ----------------------------- +
| Search for other connections | F3 |
+ ----------------------------------------- + ------- ----------------------------- +
| Search for previous connections | F4 |
+ ----------------------------------------- + ------- ----------------------------- +
| Details fare | Ctrl + J |
+ ----------------------------------------- + ------- ----------------------------- +
| Show links on the map | Ctrl + M |
+ ----------------------------------------- + ------- ----------------------------- +

g) Controlling the mouse connection list
--------------------------------

+ -------------------------------------- + ---------- ----------------------------- +
| Show extended format connection | Hover over time |
| | departure. Once changes to |
| | arrow "plus" touch |
+ -------------------------------------- + ---------- ----------------------------- +
| View basic format of connection | Hover over time |
| | arrival. Once changes to |
| | arrow to "minus" sign, then |
+ -------------------------------------- + ---------- ----------------------------- +
| Show extended format | Move the mouse pointer to the header |
| for all links found | list of links above the column sailings |
| | and then |
+ -------------------------------------- + ---------- ----------------------------- +
| View the basic format | Move the mouse pointer to the header |
| for all links found | list of links above the column arrivals |
| | and then |
+ -------------------------------------- + ---------- ----------------------------- +
| Mark connection for printing | Move the mouse pointer to the left before |
| | and then found the connection |
+ -------------------------------------- + ---------- ----------------------------- +
| Mark all connections for printing | Move the mouse pointer to the header |
| | list of links above the image printer |
| | and then |
+ -------------------------------------- + ---------- ----------------------------- +
| Lock (Cancel Lock) connection | Move the mouse pointer to the right behind |
| | and then found the connection |
+ -------------------------------------- + ---------- ----------------------------- +
| Lock (Cancel Lock) | Move the mouse pointer to the header |
| All connections | list of links above the image Castle |
| | and then |
+ -------------------------------------- + ---------- ----------------------------- +

h) Invoking the help of abbreviations notes and types of connections
-------------------------------------------------- -----

Help for abbreviations notes that appear in the column Pos., And the
abbreviations types of joints, you mouse over the respective
text. After a delay appears in a tooltip (tooltip) with text notes
or named type of joint. If you find this help at work harass,
They can be turned off using the View / Help.

i) Preference trains before buses
---------------------------------

If you are introduced simultaneously train and bus timetables, applications
when you first start automatically set in the "Options - Connection"
preference for trains before the buses. In this case, the search
connections are used between cities, in which a train, train exclusively
connection (with the exception of direct connection). If you find this setting
does not turn off.

j) connection speed search
-----------------------------

Find a connection speed depends on computer hardware and
program settings. From the hardware is particularly important quantity
RAM memory installed.

If you are running on your computer to find connections very slowly, try:

- Shorten the interval to search for connection or decrease the maximum number
  Transfer (dialog "Options - links" tab of the Parameters)
- Shorten the maximum time for transfer (tab Additional parameters)
- Reduce the number of stops, contained in the default object, for example.
  connection point of the city of Prague search for connections from the town of Prague
  or reduce the number of stops in the default object selection
  Edit / Settings object.

k) Display of the parameters in the status bar
------------------------------------------

The status line of the Connections window is displayed to the right of the main current
Parameters used in the search for a connection. Help these parameters
You should set your mouse over the text. After a delay occurs
tooltip (tooltip) with explanatory text. An easy way to change
these parameters by right-clicking on the relevant parameters.

l) Using context menus
---------------------------------

On most debug info available contextual
offers. Tenders are recalled right-clicking or
the keyboard combination Shift-F10 or Windows key on your keyboard
left of the right Ctrl key.

m) Signs on the icons connections with train timetables
-----------------------------------------

On the icons in the windows of trains arrivals / departures and connections also appear:

- VAGONKA image in the bottom left corner
  It is an artificially created direct train wagons
- Dot in the lower left corner
  this is a variant of the train, which expresses a different driving directions
  some days.

n) prints information
------------------

Information can be printed from the application in three ways:

- Printer Windows (default)
- A printer in character mode (suitable for dot-matrix printers and
  If the print speed is more important than quality)
- To a disk file (TXT, RTF and HTML).

Setting the printing process is performed on the Print dialog box, tab
How to print. Set the switch to one of the three options and choice
Edit button to make additional settings. When printing to
The file format of the target set by changing options File Type dialog
Write as windows.

a) details about the use of fare
-----------------------------

If a connection with the fare displayed, you can use the context menu or
Press Ctrl + J to bring up a window with information about the details
applied tariffs. If the fare is shown in parentheses, not
according to the given price lists to count the price for the whole connection route.

p) To view links to the map
----------------------------

The application allows a schematic view connections found on the map.
Currently available maps for bus and train timetables and
RP MHD Prague and Ostrava. Views link to the map is invoked with
context menu or by pressing Ctrl + M.


4. The uninstallation
==============

To uninstall the product serves the appropriate shortcut in the Start menu. application is
You can also be uninstalled from the Control Panel or by simply deleting
application directory (including any subdirectories).


======================
* C. Data Update *
======================

Due to frequent changes of data are updated timetables on the internet at least
at monthly intervals (but in practice there are updates continuously).
Updates are available for free on the update server CHAPS.
If you control the installation of MS Office (particularly applications
MS Excel), then we recommend that you try out extensions
IDOS - updating data (file TTUpdater.xls), which should facilitate
Update / istalaci data files.

In case that the above option is not possible, then it is necessary to update the data files
directly from the server at http://www.chaps.cz/cs/download/idos CHAPS. viewer
While driving Radul includes functionality for automatic updating of data, but it is already
update server is not supported (ie. always displays a menu of all files).


===============
* * D. Contacts
===============

1st Mail
========

CHAPS spol. s.r.o.
Bráfova 21
Brno
616 00

2. Your phone
==========

530350111

3. Electronic Mail
=====================

idos@chaps.cz

4. The Internet
===========

http://www.chaps.cz/
