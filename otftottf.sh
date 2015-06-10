#!/usr/bin/fontforge -script
Print("Opening "+$1);
Open($1);
Print("Saving "+$1:r+".ttf");
Generate($1:r+".ttf");
Quit(0);
