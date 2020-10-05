#!/bin/bash

while read LINE
    do rm -rv $LINE
done < .gitignore