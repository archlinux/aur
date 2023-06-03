#!/bin/bash
java \
  -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel \
  -Dawt.useSystemAAFontSettings=on \
  -jar /opt/jflap/JFLAP.jar
