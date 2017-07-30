#! /bin/bash
# Author: Cyano Hao < c at cyano dot cn >

# This script intends to solve the following problems:
# 1. I made a package yesterday, and there is no new build on `ftp.mozilla.org` (of cource I hate redundant fetchings);
# 2. I made a package today, but there is a new build on `ftp.mozilla.org`.

source /etc/makepkg.conf
source ./PKGBUILD

ls | grep "${_src_en_us}-${CARCH}.txt" >/dev/null
if (( "$?" == 0 )) ; then
	latest_nightly_build_time=$(eval curl \${source_${CARCH}[2]#*::} | head -n1)
	local_source_build_time=$(head -n1 $(ls | grep "${_src_en_us}-${CARCH}.txt" | tail -n1))
	local_source_download_date=$(ls | grep "${_src_en_us}-${CARCH}.txt" | tail -n1 | cut -c-8)
	today=$(date --utc +%Y%m%d)
	if [[ (( "${local_source_build_time}" == "${latest_nightly_build_time}" )) &&
	      (( "${local_source_download_date}" < "${today}" )) ]]
	then
		for file in ${local_source_download_date}-*-${CARCH}.{tar.bz2{,.asc},txt} ; do
			mv ${file} ${today}-${file#${local_source_download_date}-}
		done
	elif [[ (( "${local_source_build_time}" < "${latest_nightly_build_time}" )) &&
	        (( "${local_source_download_date}" == "${today}" )) ]]
	then
		rm ${today}-*-${CARCH}.{tar.bz2{,.asc},txt}
	fi
fi
