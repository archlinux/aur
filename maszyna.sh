#!/bin/bash

# Directories
INSTALL_DIR='/opt/maszyna'
LOCAL_DIR="${HOME}/.maszyna"

mkdir -p $LOCAL_DIR

# Copy starter binary and dependant DLLs
FILES='Starter.exe libeay32.dll ssleay32.dll'
for file in $FILES
do
  if [ ! -f ${LOCAL_DIR}/${file} ]
  then
    cp ${INSTALL_DIR}/${file} ${LOCAL_DIR}/
  fi
done

# Link game executable
if [ ! -L ${LOCAL_DIR}/eu07.exe ]
then
  ln -s ${INSTALL_DIR}/eu07 ${LOCAL_DIR}/eu07.exe
fi

# Link required data dirs/files
DIRS="data dynamic models scenery shaders sounds textures"
for dir in $DIRS
do
  if [ ! -d ${LOCAL_DIR}/${dir} ]
  then
    mkdir -p ${LOCAL_DIR}/${dir}
    for i in ${INSTALL_DIR}/${dir}/*
    do
      ln -s ${i} ${LOCAL_DIR}/${dir}/$(basename ${i})
    done
  fi
done

# Create python virtual environment and install dependencies
pushd ${LOCAL_DIR}
virtualenv2 linuxpython64
source linuxpython64/bin/activate
pip2 install pillow
popd

# Launch the starter!
pushd ${LOCAL_DIR}
wine Starter.exe
popd
