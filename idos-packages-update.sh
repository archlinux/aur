#!/bin/bash

##
#
# Version: 2018-07-18
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
# However, there is a command line options which makes the script just install packages where newer versions are available in the AUR:
#  --needed, -s, or --sloppy.
#
##

##
#
# This script depends on:
# * bash
# * python3
# * python-texttable
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


msg()
{
  if [ $# -ge 1 ]; then
    echo "$@"
  else
    cat
  fi
}

stdout_prefix()
{
  prefix="$1"
  while read line; do
    echo "${prefix}${line}"
  done
}

verbose() {
  if "${_verbose}"; then
    msg "$@"
  fi
}

debug() {
  if "${_debug}"; then
    errmsg "  [debug] $@"
  fi
}

errmsg() {
  msg "$@" > /dev/stderr
}

exiterror() {
  if [ $# -ge 2 ]; then
    _exitcode="$2"
  else
    _exitcode=1
  fi
  if [ $# -ge 1 ]; then
    _msg="$1"
  else
    _msg="$0: Unspecified Error. Aborting."
  fi
  errmsg "${_msg}"
  exit "${_exitcode}"
}

printusage() {
  echo "Usage:"
  echo "  $0 [arguments ...]"
  echo ""
  echo "Arguments (all optional):"
  echo "  -h | --help     Print this message and exit."
  echo "  -s | --sloppy | --needed"
  echo "                  Just install if the version info in the AUR is newer than"
  echo "                  the locally installed version."
  echo "                  Default is to re-installed every locally installed idos-"
  echo "                  packages since version numbers in the AUR may be outdated."
  echo "  -d | --debug    Print some detailed information as we go on."
  echo "                  (Does _not_ imply -v.)"
  echo "  -v | --verbose  Print verbose summary."
}


### Variables that can be changed by command line options:
_sloppy=false
_debug=false
_verbose=false

### Parse command line options:
while [ $# -ge 1 ]; do
  case "$1" in
   "-h"|"--help"|"help")
      shift
      printusage
      exit 0
    ;;
    "-s"|"--sloppy"|"--needed")
      _sloppy=true
      shift
    ;;
    "-d"|"--debug")
      _debug=true
      shift
    ;;
    "-v"|"--verbose")
      _verbose=true
      shift
    ;;
    *)
      _unknownarg="$1"
      shift
      errmsg "$0: Error: Unrecognised argument '${_unknownarg}'."
      errmsg ""
      errmsg "$(printusage)"
      errmsg ""
      exiterror "Aborting." 1
    ;;
  esac
done

debug "This is a debug message, testing the debug logic."


get_installed_pkgs_version() {
  # From all the packages given as arguments, returns their version number, line by line. If a package is not installed, return empty string, and:
  #   * If it is the only package given at the command line, finish with an exitcode >0.
  #   * If it is amongst other packages, silently ignore.
  
  if [ $# -eq 1 ]; then
    debug "Querying version for installed package '$1' ..."
    _raw="$(yaourt -Q "$1")"
    exitcode_query="$?"
    if [ "${exitcode_query}" -eq 0 ]; then
      echo "${_raw}" | awk '{print $2}'
    else
      echo ''
    fi
  else
    while [ $# -ge 1 ]; do
      debug "Querying version for installed package '$1' ..."
      _raw="$(yaourt -Q "$1" 2>/dev/null)"
      _exitcode="$?"
      if [ "${_exitcode}" -eq 0 ]; then
        echo "${_raw}" | awk '{print $2}'
      else
        echo ''
      fi
      shift
    done
    exitcode_query=0
  fi
  
  return "${exitcode_query}"
}

get_aur_pkgs_version() {
  # From all the packages given as arguments, returns their version number, line by line, as in the AUR. If a package is not available in the repositories, return empty string, and:
  #   * If it is the only package given at the command line, finish with an exitcode >0.
  #   * If it is amongst other packages, silently ignore.

  if [ $# -eq 1 ]; then
    debug "Querying version for package 'aur/$1' ..."
    _raw="$(yaourt -Si "aur/$1")"
    exitcode_query="$?"
    if [ "${exitcode_query}" -eq 0 ]; then
      echo "${_raw}" | sed -n -r 's|^Version[[:space:]]*\:[[:space:]]*||p'
    else
      echo ''
    fi
  shift
  else
    while [ $# -ge 1 ]; do
      debug "Querying version for package 'aur/$1' ..."
      _raw="$(yaourt -Si "aur/$1" 2>/dev/null)"
      _exitcode="$?"
      if [ "${_exitcode}" -eq 0 ]; then
        echo "${_raw}" | sed -n -r 's|^Version[[:space:]]*\:[[:space:]]*||p'
      else
        echo ''
      fi
      shift
    done
    exitcode_query=0
  fi
  
  return "${exitcode_query}"
}

### Those variables will hold, line by line, the packages available for installation and the ones installed:
avail=''
installed=''

for pkg_string in "${idos_pkgs_strings[@]}"; do
  ### Get packages available for installation. The "echo ''" is there to get a newline added if new content is following.
  debug "Searching for installable packages matching the search string '${pkg_string}' ..."
  avail+="$(echo ''; yaourt -S -q -s "${pkg_string}")"
  ### Get packages which are installed. The "echo ''" is there to get a newline added if new content is following.
  debug "Searching for installed packages matching the search string '${pkg_string}' ..."
  installed+="$(echo ''; yaourt -Q -q -s "${pkg_string}"; echo '')"
done

### Set union of available and installed packages:
installed_or_available="${avail}
${installed}"

### Sort and unify and remove blank lines:
avail="$(echo "${avail}" | sort | uniq | grep -E .)"
installed="$(echo "${installed}" | sort | uniq | grep -E .)"
installed_or_available="$(echo "${installed_or_available}" | sort | uniq | grep -E .)"

### Get version numbers of installed packages before upgrade:
old_vers="$(echo "${installed}" | while read pkg; do get_installed_pkgs_version "${pkg}"; done)"
# old_vers="$(get_installed_pkgs_version ${installed})"

### Get AUR version numbers of installed packages:
aur_vers="$(echo "${installed}" | while read pkg; do get_aur_pkgs_version "${pkg}" 2>/dev/null || echo ''; done)"
# aur_vers="$(get_aur_pkgs_version ${installed})"

### Get packages which are installed and available for installation at the same time:
#installed_and_available="$(comm -1 -2 <(echo "${installed}" | sort) <(echo "${avail}" | sort))" # comm would do the job, on sorted files. grep also works on unsorted files.
installed_and_available="$(echo "${avail}" | grep -F -x "${installed}" | sort | uniq)"


### Reformat to python-lists:
py_old_vers="$(echo '['; echo "${old_vers}" | while read line; do echo "'${line}',"; done; echo ']')"
py_aur_vers="$(echo '['; echo "${aur_vers}" | while read line; do echo "'${line}',"; done; echo ']')"
py_installed="$(echo '['; echo "${installed}" | while read line; do echo "'${line}',"; done; echo ']')"

### Print some information:
echo "Installed IDOS-related packages, with version information."
echo ""

cat << EOPY | python3
import texttable

inst=${py_old_vers}
aur=${py_aur_vers}
pkg=${py_installed}

tbl=texttable.Texttable(0)
tbl.header(['AUR ver.','Installed ver.','Package'])
tbl.add_rows([list(x) for x in zip(*[aur,inst,pkg])],header=False)

print(tbl.draw())
EOPY


# echo "  Installed version  AUR version  package  "
# _pkgnr=0
# echo "${installed}" | while read pkg; do
#   _pkgnr="$(( ${_pkgnr} + 1 ))"
#   if echo "${avail}" | grep -q -F -x "${pkg}"; then echo -n "   (x)  "; else echo -n "        "; fi
#   echo -n "${pkg}   "; echo "${old_vers}" | sed -n "${_pkgnr}"p
# done
# echo ""

exit 11

### Reinstall installed and available packages:
yaourt -S --noconfirm ${installed_and_available}


### Get version numbers of installed packages after upgrade:
new_vers="$(echo "${installed}" | while read pkg; do get_installed_pkgs_version "${pkg}"; done)"

### Print information about changes that were carried out:
echo "Upgrade results ('(y)': Upgraded, '(n)': Not upgraded, no marker: Not"
echo "available in repositories) with version information:"
echo ""
_pkgnr=0
echo "${installed}" | while read pkg; do
  _pkgnr="$(( ${_pkgnr} + 1 ))"
  _old_ver="$(echo "${old_vers}" | sed -n "${_pkgnr}"p)"
  _new_ver="$(echo "${new_vers}" | sed -n "${_pkgnr}"p)"
  if [[ "${_old_ver}" == "${_new_ver}" ]]; then
    if echo "${avail}" | grep -q -F -x "${pkg}"; then echo -n "   (n)  "; else echo -n "        "; fi
  else
    echo -n "   (y)  "
  fi
  echo -n "${pkg}   "
  echo -n "${_old_ver} "
  if [[ "${_old_ver}" == "${_new_ver}" ]]; then
    echo "(not upgraded.)"
  else
    echo "-> ${_new_ver}"
  fi
done
