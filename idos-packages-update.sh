#!/bin/bash

VERSION=20210704.1

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
# * yay
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


### Packages with those regexp's are ignored. No whitespaces are allowed!
idos_ignore_pkgs_regexps=(
  '\-license'
)


msg()
{
  if [ $# -ge 1 ]; then
    cat <<< "$@"
  else
    cat
  fi
}

stdout_prefix()
{
  prefix="$1"
  while read line; do
    cat <<< "${prefix}${line}"
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
  msg "Usage:"
  msg "  $0 [arguments ...]"
  msg ""
  msg "Arguments (all optional):"
  msg "  -h | --help      Print this message and exit."
  msg "  -s | --sloppy | --needed"
  msg "                   Just install if the version info in the AUR is newer than"
  msg "                   the locally installed version."
  msg "                   Default is to re-installed every locally installed idos-"
  msg "                   packages since version numbers in the AUR may be outdated."
  msg "  -l | --list      Only list version numbers of installed packages and their"
  msg "                   AUR equivalents, and what would be done. Do not upgrade."
  msg "  -d | --debug     Print some detailed information as we go on."
  msg "                   (Does _not_ imply -v.)"
  msg "  -v | --verbose   Print verbose summary."
  msg "  -V | --version   Print version."
}


### Variables that can be changed by command line options:
_sloppy=false
_listonly=false
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
      export _sloppy
      shift
    ;;
    "-l"|"--listonly")
      _listonly=true
      export _listonly
      shift
    ;;
    "-d"|"--debug")
      _debug=true
      export _debug
      shift
    ;;
    "-v"|"--verbose")
      _verbose=true
      export _verbose
      shift
    ;;
    "-V"|"--version")
      shift
      msg "${VERSION}"
      exit 0
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


get_aur_pkgs_version() {
  # From all the packages given as arguments, returns their version number, line by line, as in the AUR. If a package is not available in the repositories, return empty string, and:
  #   * If it is the only package given at the command line, finish with an exitcode >0.
  #   * If it is amongst other packages, silently ignore.
  #
  # NOTE: For some reasons debug messages herein do not get printed the way we are called ...
  
  if [ $# -eq 1 ]; then
    debug "Querying version for package 'aur/$1' ..."
    _raw="$(yay -Si "aur/$1")"
    exitcode_query="$?"
    if [ "${exitcode_query}" -eq 0 ]; then
      cat <<< "${_raw}" | sed -n -r 's|^Version[[:space:]]*\:[[:space:]]*||p'
    else
      cat <<< ''
    fi
  shift
  else
    while [ $# -ge 1 ]; do
      debug "Querying version for package 'aur/$1' ..."
      _raw="$(yay -Si "aur/$1" 2>/dev/null)"
      _exitcode="$?"
      if [ "${_exitcode}" -eq 0 ]; then
        cat <<< "${_raw}" | sed -n -r 's|^Version[[:space:]]*\:[[:space:]]*||p'
      else
        cat <<< ''
      fi
      shift
    done
    exitcode_query=0
  fi
  
  return "${exitcode_query}"
}

compare_versions() {
  # Compares "$1" against "$2" as if they were version numbers. Uses 'sort -V' to do the actual work.
  # Output:
  #   ">" if "$1" >  "$2",
  #   "=" if "$1" == "$2",
  #   "<" if "$1" <  "$2".

  if [ "$1x" == "$2x" ]; then
    cat <<< "="
  else

    _smalleritem="$({
      cat <<< "$1"
      cat <<< "$2"
    } | sort -V | head -n 1)"
    
    if [ "${_smalleritem}x" == "$2x" ]; then
      cat <<< ">"
    else
      cat <<< "<"
    fi
  fi
}

### Those variable will hold package information.
# Syntax:
# * The key is the package name.
# * The content of the entry contains the data/ flags, separated by space:
#   - 'i=[true|false]' means the package is locally installed (if not present, not installed is assumed),
#   - 'ov=<version>' is the version number of the installed package prior to upgrade,
#   - 'nv=<version>' is the version number of the installed package after upgrade,
#   - 'av=<version>' is the version number of the package in the repositories/ AUR.
#     Presence of this entry also means the package is available in the repositories/ AUR at all.
#   - 'u=[true|false]' specifies if the package should be included in upgrade (if not specified, no upgrade will be done),
#   - 'v=<string>' is an informational string to present to the user in the pretty-printed output
#     to tell about the status (available in the repositories/ AUR, will be upgraded, ...).

unset pkgs
declare -A pkgs
unset upgrades
declare -a upgrades

for pkg_string in "${idos_pkgs_strings[@]}"; do
  ### Get packages which are installed.
  debug "Searching for installed packages matching the search string '${pkg_string}' ..."
  for _pkg_ver_group in $(pacman -Q -s "${pkg_string}" | sed -n 's|^local/||p' | grep -v "${idos_ignore_pkgs_regexps[@]/#/-e}" | tr ' \t' ';;'); do
    _pkg="$(awk -F';' '{print $1}' <<< "${_pkg_ver_group}")"
    _old_ver="$(awk -F';' '{print $2}' <<< "${_pkg_ver_group}")"
    _aur_ver="$(get_aur_pkgs_version "${_pkg}" 2>/dev/null || cat <<< '')"
    pkgs["${_pkg}"]="i=true ov=${_old_ver}"
    if [ -n "${_aur_ver}" ]; then
      if "${_sloppy}"; then
        if [ "$(compare_versions "${_aur_ver}" "${_old_ver}")" == '>' ]; then
          _upgrade='true'
          _info='(y)'
        else
          _upgrade='false'
          _info='(n)'
        fi
      else
        _upgrade='true'
        _info='(y)'
      fi
      pkgs["${_pkg}"]+=" av=${_aur_ver} u=${_upgrade} v=${_info}"
    else
      _upgrade='false'
      _info='(-)'
      pkgs["${_pkg}"]+=" u=${_upgrade} v=${_info}"
    fi
    if "${_upgrade}"; then
      upgrades+=("${_pkg}")
    fi
    debug "* ${_pkg}: ${pkgs["${_pkg}"]}"
  done
done



### Print some information.
msg "IDOS-related packages, before upgrade:"
msg ""

{
  cat <<< ';;;'
  for _pkg in $(tr ' ' '\n' <<< "${!pkgs[@]}" | sort -n); do
    _flags="${pkgs["${_pkg}"]}"
    _info="$(sed -En 's|^.*v=([^ ]*).*$|\1|gp' <<< "${_flags}")"
    _old_ver="$(sed -En 's|^.*ov=([^ ]*).*$|\1|gp' <<< "${_flags}")"
    _aur_ver="$(sed -En 's|^.*av=([^ ]*).*$|\1|gp' <<< "${_flags}")"
    if [ -n "${_aur_ver}" ]; then
      _ver_diff="$(compare_versions "${_old_ver}" "${_aur_ver}")"
    else
      _ver_diff=" "
    fi
    
    cat <<< "${_info} |;${_pkg};| ${_old_ver};${_ver_diff} ${_aur_ver}"
  done
} | column -o ' ' -s ';' -t -R 1,2 -N 'upgr.?,package,| local ver.,| AUR ver.'
msg ''



if "${_listonly}"; then
  verbose "-l | --listonly option specified, will not actually upgrade."
  exit 0
fi

### Reinstall the packages to be upgraded:
if [ ${#upgrades[@]} -ge 1 ]; then
  verbose "Installing packages ${upgrades[@]} ..."
  yay -S --noconfirm "${upgrades[@]}"
else
  msg "Nothing to be updated. Exiting."
  exit 0
fi


### Get version numbers of installed packages after upgrade. Do it at once, since each call pacman -Q call does cost a considerable amount of time:
for _pkg_ver in $(pacman -Q "${!pkgs[@]}"  | tr ' ' ';'); do
  debug "Getting versions of packages after installation ..."
  _pkg="$(awk -F';' '{print $1}' <<< "${_pkg_ver}")"
  _new_ver="$(awk -F';' '{print $2}' <<< "${_pkg_ver}")"
  pkgs["${_pkg}"]+=" nv=${_new_ver}"
  debug "* ${_pkg}: ${pkgs["${_pkg}"]}"
done


### Print information about changes that were carried out:
msg ""
msg "IDOS-related packages, after upgrade:"
msg ""

{
  cat <<< ';;'
  for _pkg in $(tr ' ' '\n' <<< "${!pkgs[@]}" | sort -n); do
    _flags="${pkgs["${_pkg}"]}"
    _old_ver="$(sed -En 's|^.*ov=([^ ]*).*$|\1|gp' <<< "${_flags}")"
    _new_ver="$(sed -En 's|^.*nv=([^ ]*).*$|\1|gp' <<< "${_flags}")"
    _ver_diff="$(compare_versions "${_old_ver}" "${_new_ver}")"
    
    cat <<< "${_pkg};| ${_old_ver};${_ver_diff} ${_new_ver}"
  done
} | column -o ' ' -s ';' -t -R 1 -N 'package,| old ver.,| new ver.'
