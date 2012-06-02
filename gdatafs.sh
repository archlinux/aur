#! /bin/sh

pushd /opt/gdatafs > /dev/null
	/opt/gdatafs/gdatafs "$1" "$2" "$3"
popd > /dev/null
