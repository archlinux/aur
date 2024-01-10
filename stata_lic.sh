#!/bin/bash

# Set these to the correct values for your license
ST_SERIAL="Your serial here e.g. 123558358"
ST_CODE="Your code here e.g. 2393 2342 x329 3494 x349"
ST_AUTH="Your auth here e.g. abcd"
# These two don't matter too much, but will show in the "Licensed to" field.
# The prompt suggests your name if it's individual, or the institution name otherwise.
ST_NAME="Your name or institution name here"
ST_LOCATION="Your location here"


# Check the user has entered something...
if [ "$ST_SERIAL" = 'Your serial here e.g. 123558358' ]
then
    echo "Error! You haven't entered licensing details. Please read the README.md in full."
    exit 1
fi


# This just inputs all needed interactive input for license generation to happen noninteractively
echo -e "y\ny\n$ST_SERIAL\n$ST_CODE\n$ST_AUTH\ny\ny\n$ST_NAME\n$ST_LOCATION\ny\n" | ./stinit
