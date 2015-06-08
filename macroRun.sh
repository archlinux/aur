#!/bin/sh

macroNumber=$1
macroName=macro${macroNumber}.rec
macroDir=~/.config/xmacro

xmacroplay :0 < $macroDir/${macroName}
