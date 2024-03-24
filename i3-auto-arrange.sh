#! /bin/sh

workspaces=$(i3-msg -t get_workspaces)
n_workspaces=$(echo "$workspaces" | jq length)

i=0
while [ "$i" -lt "$n_workspaces" ]
do
	current_number=$(echo "$workspaces" | jq ".[$i].n_workspaces")
	expected_number=$($i + 1)
	
  if [ "$current_number" -ne "$expected_number" ]
	then
		i3-msg -q rename workspace "$current_number" to "$expected_number"
	fi
done
