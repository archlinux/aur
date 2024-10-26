#!/bin/sh

if [ ! -d "~/.BlackBoard" ]; then mkdir ~/.BlackBoard; cp -R /opt/blackboard/{models,symbols,parts,datasheets,simulators} ~/.BlackBoard; fi
