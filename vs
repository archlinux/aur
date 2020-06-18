#!/bin/bash
#This is a small wrapper that lets VegaStrike - Upon the coldest ocean run from seemingly anywhere
if [ -d /usr/local/share/vegastrike ]; then 
	vegastrike -d/usr/local/share/vegastrike
	else
	vegastrike -d/usr/share/vegastrike
fi
