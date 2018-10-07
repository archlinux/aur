#!/usr/bin/bash

set -e
shopt -s nocasematch
source '/usr/share/makepkg/util.sh'
[[ -t 2 ]] && colorize

msg 'Query list of nightly sources'
srcurl='http://nightlies.videolan.org/build/source/'
srclist=$(curl "$srcurl")

msg 'Find latest nightly'
fileregex='(<a\ +href=\")(vlc-([^\"]+)-([^\"]+)-([^\"]+)-([^\"]+))(\">)'
if ! [[ $srclist =~ $fileregex ]]; then
    echo 'No source found'
    exit -1
fi
srcfile=${BASH_REMATCH[2]}
msg2 "source file: $srcfile"

msg 'Split file name of latest nightly into components used in the PKGBUILD'
compregex='vlc-(.*)-(.*)-(.*)-(.*).tar.xz'
if ! [[ $srcfile =~ $compregex ]]; then
    echo 'Unable to split source file into components used in PKGBUILD'
    exit -1
fi
version=${BASH_REMATCH[1]}
date=${BASH_REMATCH[2]}
strange_number=${BASH_REMATCH[3]}
suffix=${BASH_REMATCH[4]}
msg2 "version:        $version"
msg2 "date:           $date"
msg2 "strange number: $strange_number"
msg2 "suffix:         $suffix"

msg 'Update PKGBUILD'
mv 'PKGBUILD' 'PKGBUILD.bak'
awk \
    -v pkgver="pkgver=${version}v${date}" \
    -v _pkgver="_pkgver=${version}" \
    -v _snapshot_="_snapshot_=${date}" \
    -v _snapver_="_snapver_=${strange_number}" \
    -v _suffix_="_suffix_=${suffix}" \
'   /^[[:blank:]]*_pkgver=.*$/ {
        print _pkgver
        next
    }
    /^[[:blank:]]*pkgver=.*$/ {
        print pkgver
        next
    }
    /^[[:blank:]]*_snapshot_=.*$/ {
        print _snapshot_
        next
    }
    /^[[:blank:]]*_snapver_=.*$/ {
        print _snapver_
        next
    }
    /^[[:blank:]]*_suffix_=.*$/ {
        print _suffix_
        next
    }
    1
    END {

    }
' \
    'PKGBUILD.bak' > 'PKGBUILD'
git diff 'PKGBUILD'
