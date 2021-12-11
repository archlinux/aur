#!/bin/sh
tmp="`mktemp`"

tags=(
	'em'
	'code'
)

# If testing is needed
#set -x

while read -r appstream_data
do
    # Set up the appropriate commands
    if [[ "${appstream_data}" == *.gz ]]
    then
        CAT=zcat
        COMPRESS=gzip
    else
        CAT=cat
        COMPRESS=cat
    fi


    echo "\ Checking ${appstream_data}..."
	for tag in ${tags[*]}
 	do
		bad_matches=`$CAT "${appstream_data}" | grep -cm1 "<${tag}>"`
		if [ "$bad_matches" = 1 ]
		then
			echo -n " - Fixing not-handled tag ${tag} ... "
			$CAT "${appstream_data}" | sed "s|<${tag}>||g ; s|<\/${tag}>||g ;" | $COMPRESS > "${tmp}"
			cp  "${tmp}" "${appstream_data}"
			rm  "${tmp}"
			echo "fixed"
		fi
	done
done

