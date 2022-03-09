#!/bin/sh

if whereis unionfs-fuse>/dev/null 2>&1; then
	if whereis dosbox>/dev/null 2>&1; then
		mkdir -p ~/.abandonia/midnight-rescue/temp
		mkdir -p ~/.abandonia/midnight-rescue/persistent
		unionfs -o cow -o umask=000 ~/.abandonia/midnight-rescue/persistent=RW:/opt/abandonia/midnight-rescue=RO ~/.abandonia/midnight-rescue/temp
		dosbox ~/.abandonia/midnight-rescue/temp/SSR.EXE
		fusermount -u ~/.abandonia/midnight-rescue/temp			
	else
		echo '==> Error: dosbox not found'
	fi
else
	echo '==> Error: unionfs-fuse not found'
fi
