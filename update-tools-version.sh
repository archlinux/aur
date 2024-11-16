#!/bin/bash

# Read the .tool-versions file
while read -r line; do
  # Extract the tool name
  tool=$(echo $line | awk '{print $1}')
  
  # Update the tool to the latest version
  asdf install $tool latest
  asdf local $tool latest
done < .tool-versions

echo "All tools have been updated to their latest versions."