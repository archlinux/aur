#!/usr/bin/env bash

# Move to this script directory
_my_dir=$(readlink -f $0 | xargs dirname)
cd $_my_dir

patch_file="$_my_dir/webcore_mapfile-vers.patch"

# Find the archive
source_archive=$(ls -1 java17-openjfx-*.tar.gz)

if [ -z "$source_archive" ]
then
    echo "No archive detected, exiting early..."
    exit 1
fi

echo "Working on: $source_archive"
mapfile=$(tar tf $source_archive | grep mapfile-vers)
mapfile_dir=$(dirname $mapfile)

echo "Extracting $mapfile ..."
tar xvf $source_archive $mapfile

pushd $mapfile_dir

echo "Applying standard patch ..."
cp mapfile-vers mapfile-vers.orig
patch -N -i $patch_file

echo "Applying extra fixes ..."
for l in $(cat $_my_dir/to_remove.txt)
do
    echo "Removing $l ..."
    sed -i "/$l/d" mapfile-vers
done

echo "Generate the updated patch ..."
cat > $patch_file << EOF
Remove all the symbols identified in the build process as missing.
The symbols may appear in official JDK, I believe.

To see all symbols, build up to failure and run the last command with added:
    -Wl,--error-limit=0
to see all missing symbols.

Then patch the mapfile-vers via:
    for l in \$(cat to_remove.txt)
    do
        echo "Removing \$l ..."
        sed -i "/\$l/d" mapfile-vers
    done

This patch is made with the process just above.

EOF

diff -u mapfile-vers.orig mapfile-vers >> $patch_file

popd
echo "Done!"
