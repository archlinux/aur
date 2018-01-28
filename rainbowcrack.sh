#!/bin/bash
set -e

bin_name=$(basename "${0}")
if [[ "${bin_name}" == "rainbowcrack" ]];
then
	bin_name="rcrack"
fi

cd /opt/rainbowcrack
./${bin_name} ${@}
