#!/bin/sh

POLICY_FILE=/usr/lib/librewolf/distribution/policies.json
CFG_FILE=/usr/lib/librewolf/librewolf.cfg

POLICY_MOD_FILE=/usr/lib/librewolf/distribution/policies.json-comment-out-list
CFG_MOD_FILE=/usr/lib/librewolf/librewolf.cfg-comment-out-list

touch $CFG_MOD_FILE
touch $POLICY_MOD_FILE

while IFS= read -r line
do
	sed -i -e "s/^lockPref(\"$line\"/\/\/lockPref(\"$line\"/g" \
				 -e "s/^defaultPref(\"$line\"/\/\/defaultPref(\"$line\"/g" \
				 $CFG_FILE
done < $CFG_MOD_FILE


while IFS= read -r line
do
	sed -i "s/\"$line\":/\"__COMMENT__ $line\":/g" $POLICY_FILE
done < $POLICY_MOD_FILE

# vim:fileencoding=utf-8:ts=2:shiftwidth=2
