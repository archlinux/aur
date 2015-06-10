# WeatherSpect v1.11 #

## Description ##

WeatherSpect provides a reasonably accurate simulation of what the weather looks like outside, in ASCII art. It includes rain, snow, lightning, sleet, and hail. The windspeed and cloudiness are reflected in the velocity and quantity of clouds. There are trees that age, reproduce and die over the course of an hour, and a sun and moon that follow the actual sun and moonrise. There's also a dancing turtle.

## Requirements ##

You must have the Term::Animation module, which you can get from http://www.cpan.org. The Term::Animation module also requires the Curses module, which you can also get from CPAN.

## Usage ##

Before weatherspect will work, you have to create a config file for it. Running it with the -c option will prompt you for info to create a config file in ~/.weatherspect.

    weatherspect -h: Print this help message
    weatherspect -f <file>: Supply a config file to use instead of the default
    weatherspect -c: Generate a config file

While weatherspect is running, the following commands are available:

    q: Quit
    h: Toggle the help window
    w: Toggle the detailed weather info window
    d: Toggle the debug window
    u: Force an update of weather data
    r: Redraw. This will remove all objects and recreate them, probably in different places.

## Credits ##

by Kirk Baucom <kbaucom@schizoid.com> [http://www.robobunny.com](http://www.robobunny.com)

* Kevin Ferree (http://chavo-one.com): All art in the code marked with 'kf'
* Hayley Wakenshaw (http://www.bornsquishy.com/flump/index.html): All art in the code marked with 'hjw'
* Joan Stark (http://www.geocities.com/SoHo/7373/): All art in the code marked with 'jgs'

You can grep for ATTRIB in the code to get a list of credits for all the ASCII art.
