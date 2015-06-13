#!/bin/bash

if [ ! -d ./data ];then
    echo  'no org_data'
    exit 1
fi
if [ ! -d ./pkg ];then
    echo  'no pkg_data'
    exit 1
fi
if [ -d ./temp ];then
    rm -r ./temp
fi
mkdir ./temp

# opt dir
find data/opt |sed 's/^data//g' |sort >./temp/org_data
find pkg/wpsoffice-common/opt |sed 's/^pkg\/wpsoffice-common//g' >./temp/_tmp
find pkg/wpsoffice/opt |sed 's/^pkg\/wpsoffice//g' >>./temp/_tmp
sort ./temp/_tmp >./temp/pkg_data
diff -Nur ./temp/org_data ./temp/pkg_data >./temp/opt_diff
# etc dir
find data/etc |sed 's/^data//g' |sort >./temp/org_data
find pkg/wpsoffice-common/etc |sed 's/^pkg\/wpsoffice-common//g' |sort >./temp/pkg_data
diff -Nur ./temp/org_data ./temp/pkg_data >./temp/etc_diff
# usr dir
find data/usr |sed 's/^data//g' |sort >./temp/org_data
find pkg/wpsoffice-common/usr |sed 's/^pkg\/wpsoffice-common//g' |sort >./temp/pkg_data
diff -Nur ./temp/org_data ./temp/pkg_data >./temp/usr_diff
