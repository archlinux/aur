#!/bin/bash

##
#
# Version: 2016-07-06
#
##

##
#
# This script re-installs packages related to the IDOS timetable information system, to update them when an update is available.
# Since most packages are getting update upstream without any change in download URL, the packages are maintained in a similar way
# as version control system based packages (e.g. ${pkgname}-git-style, though not on a version control system the extension "-latest"
# is used). Thus, the version number of the packages in the AUR is purely cosmetic and reflects the current version from the time of
# the last submit to the AUR. Newer versions may be there, and so this script simply installs the latest version. The locally
# installed package will have the correct version number.
#
##

##
#
# This script depends on:
# * bash
# * yaourt
# * basic utilities: grep, sort, uniq.
#   (Instead of grep, comm also can be used, by swapping the comment in front of the respective lines).
#
##


### Abort on error:
set -e


### Packages with these strings in their names are beeing re-installed by this script:
idos_pkgs_strings=(
  'idos-'
  'ttf-timetable'
)

get_installed_pkgs_version() {
  # From all the packages given as arguments, returns their version number, line by line. If a package is not installed, return empty string, and:
  #   * If it is the only package given at the command line, finish with an exitcode >0.
  #   * If it is amongst other packages, silently ignore.
  
  if [ $# -eq 1 ]; then
    yaourt -Q "$1" | awk '{print $2}'
    exitcode_query="$?"
  else
    while [ $# -gt 1 ]; do
      yaourt -Q "$1" 2>/dev/null | awk '{print $2}'
      shift
    done
    exitcode_query=0
  fi
  
  return "${exitcode_query}"
}

### Those variables will hold, line by line, the packages available for install and the one installed:
avail=''
installed=''

for pkg_string in "${idos_pkgs_strings[@]}"; do
  ### Get packages available for installation. The "echo ''" is there to get a newline added if new content is following.
  avail+="$(echo ''; yaourt -S -q -s "${pkg_string}")"
  ### Get packages which are installed. The "echo ''" is there to get a newline added if new content is following.
  installed+="$(echo ''; yaourt -Q -q -s "${pkg_string}"; echo "")"
done


### Sort and unify and remove blank lines:
avail="$(echo "${avail}" | sort | uniq | grep -E .)"
installed="$(echo "${installed}" | sort | uniq | grep -E .)"

### Get version numbers of installed packages before upgrade:
old_vers="$(echo "${installed}" | while read pkg; do get_installed_pkgs_version "${pkg}"; done)"

### Get packages which are installed and available for installation at the same time:
#installed_and_available="$(comm -1 -2 <(echo "${installed}" | sort) <(echo "${avail}" | sort))" # comm would do the job, on sorted files. grep also works on unsorted files.
installed_and_available="$(echo "${avail}" | grep -F -x "${installed}" | sort | uniq)"


### Print some information:
_reinstall_marker="(x)"
echo "Installed IDOS-related packages with version. Packages marked with ${_reinstall_marker} can and will be reinstalled."
echo ""
_pkgnr=0
echo "${installed}" | while read pkg; do
  _pkgnr="$(( ${_pkgnr} + 1 ))"
  if echo "${avail}" | grep -q -F -x "${pkg}"; then echo -n "   ${_reinstall_marker}  "; else echo -n "        "; fi
  echo -n "${pkg}   "; echo "${old_vers}" | sed -n "${_pkgnr}"p
done
echo ""


### Reinstall installed and available packages:
yaourt -S --noconfirm ${installed_and_available}


### Get version numbers of installed packages after upgrade:
new_vers="$(echo "${installed}" | while read pkg; do get_installed_pkgs_version "${pkg}"; done)"

### Print information about changes that were carried out:
echo "Upgrade results:"
echo ""
_pkgnr=0
echo "${installed}" | while read pkg; do
  _pkgnr="$(( ${_pkgnr} + 1 ))"
  _old_ver="$(echo "${old_vers}" | sed -n "${_pkgnr}"p)"
  _new_ver="$(echo "${new_vers}" | sed -n "${_pkgnr}"p)"
  if echo "${avail}" | grep -q -F -x "${pkg}"; then echo -n "   ${_reinstall_marker}  "; else echo -n "        "; fi
  echo -n "${pkg}   "
  echo -n "${_old_ver} "
  if [[ "${_old_ver}" == "${_new_ver}" ]]; then
    echo "(not upgraded.)"
  else
    echo "-> ${_new_ver}"
  fi
done
