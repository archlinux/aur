#!/bin/bash
# 
# cups-programme
# 
# 
# The purpose of the backend is to print print jobs to a file and then
# open it with a programme which the user can set in the options.
#
# License: GNU GPL Version 3 or later (at your choice), see http://www.gnu.org/licenses/gpl-3.0.en.html (as of 2018-05-20).
#
# This work is based on the 2file example backend from
# https://community.kde.org/Printing/Developer_Tools#.272file.27_CUPS_backend_script_.28Bash_code.29,
# retrieved on 2018-05-19, which has been licensed under GNU GPL version
# 2 or version 3 (user's choice).
#
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# The version.
VERSION=0.1

# Abort on error
set -e

# The name of this backend. Do not change.
backend_name='cups-programme'

# The config file
conffile=/etc/cups/cups-programme.conf

# Timestamp
tstamp="$(date '+%Y-%m-%d_%T%z')"

# Write to stderr:
stderr() {
  echo "$@" 1>&2
}

### Local logging:
log_local() {
  echo "$@" >> "${logfile}"
}

### CUPS logging with corresponding loglevels:
log_cups() {
  stderr "$@"
  log_local "$@"
}

info() {
  firstarg="$1"
  shift
  log_cups "INFO: ${firstarg}" "$@"
}

notice() {
  firstarg="$1"
  shift
  log_cups "NOTICE: ${firstarg}" "$@"
}

warn() {
  firstarg="$1"
  shift
  log_cups "WARN: ${firstarg}" "$@"
}

error() {
  firstarg="$1"
  shift
  log_cups "ERROR: ${firstarg}" "$@"
}

crit() {
  firstarg="$1"
  shift
  log_cups "CRIT: ${firstarg}" "$@"
}

alert() {
  firstarg="$1"
  shiftlog_
  log_cups "ALERT: ${firstarg}" "$@"
}

emerg() {
  firstarg="$1"
  shift
  log_cups "EMERG: ${firstarg}" "$@"
}


### Reading arguments passed from CUPS:
backend=${0}
jobid=${1}
cupsuser=${2}
jobtitle=${3}
jobcopies=${4}
joboptions=${5}
jobfile=${6}

# Setting, and creating/clearing our logfile:
logfile="/tmp/${backend_name}.${jobid}.log"
echo -n '' > "${logfile}"
# Make it world read- and writeable, in case we are run under varying user IDs.
chmod 666 "${logfile}" 2>/dev/null || true

log_local "$0 started at ${tstamp}. Our log file is: ${logfile}."
log_local ""




### The command we want to execute will be fetched from the environment variable 'DEVICE_URI'.
# 
# $DEVICE_URI format:
# 
#   ${backend_name}:<command>?u=<user>&g=<group>&D=<display>&<argument>&<argument>...
# 
# All arguments, including the 'u=<user>', 'g=<group>' and 'D=<display>', are optional.
# Argument delimiter character is '#'.
#
# In '<argument>', the following replacements will be carried out:
#   - '%s' -> "${tmpfile}" (Where we save the output from CUPS),
#   - '%.' -> ' '
#   - '%_' -> '-'
#   - '%P' -> '|'
#   - '%B' -> '\'
#   - '%H' -> '#'
#   - '%Q' -> '?'
#   - '%A' -> '&'
#   - '%%' -> '%'
# 
# The programme will be invoked with the specified arguments, and the
# file name of the print job appended.
# The print job will be a PostScript file.

# Getting the command from $DEVICE_URI:
cmd="$(echo "${DEVICE_URI}" | sed "s|^${backend_name}":'||g' | sed 's|?.*$||')"

# Getting the raw options, arguments, ... from $DEVICE_URI:
argstr="$(echo "${DEVICE_URI}" | sed -n 's|^[^?]*?\(.*\)$|\1|p')"

# Creating and retrieving the name of the temporary file, for CUPS print output:
# tmpfile="$(mktemp --tmpdir=/tmp --suffix=.ps "${backend_name}_job-${jobid}_${jobtitle}.XXXXX")"
tmpfile="/tmp/${backend_name}_job-${jobid}_${jobtitle}.ps"

# Taking the raw options, arguments, ... apart:
IFS='&' read -r -a argv <<< "${argstr}"

# Parsing the options, arguments, ...:
cmd_args=()
unset user
unset group
unset display
# Have this as function that we will call, so that we can make use of 'shift'.
parse_argv() {
  log_local "Parsing options ${@@Q}."
  while [ $# -gt 0 ]; do
    case "$1" in
      u=*)
        user="${1#u=}"
        log_local "  Parsing 'u='-option. User: '${user}'."
      ;;
      g=*)
        group="${1#g=}"
        log_local "  Parsing 'g='-option. Group: '${group}'."
      ;;
      D=*)
        display="${1#D=}"
        log_local "  Parsing 'D='-option. Display: '${display}'."
      ;;
      *)
        arg=("$(echo "$1" | replace '%%' '%' '%s' "${tmpfile}" '%.' ' ' '%_' '-' '%P' '|' '%B' '\' '%H' '#' '%Q' '?' '%A' '&' )")
        log_local "  Parsing next argument. It will be: '${arg}'."
        cmd_args+=("${arg}")
      ;;
    esac
    shift
  done
  log_local ""
}

parse_argv "${argv[@]}"


### Log some debugging information
log_local "--- Some debugging information. ---"
log_local "We were called as:"
log_local "  $0 $@"
log_local ""
log_local "Number of command line arguments passed to us: $#".
log_local ""
log_local "Information passed from CUPS:"
log_local "  - backend=${backend}"
log_local "  - jobid=${jobid}"
log_local "  - cupsuser=${cupsuser}"
log_local "  - jobtitle=${jobtitle}"
log_local "  - jobcopies=${jobcopies}"
log_local "  - joboptions=${joboptions}"
log_local "  - jobfile=${jobfile}"
log_local "  - DEVICE_URI=${DEVICE_URI}"
log_local ""
log_local "Information we extracted from \$DEVICE_URI":
log_local "  - command=${cmd}"
log_local "  - argstr=${argstr}"
log_local "  - #argv=${#argv[@]}"
log_local "  - argv=${argv[@]}"
log_local "  - #cmd_args=${#cmd_args[@]}"
log_local "  - cmd_args=${cmd_args[@]}"
log_local "  - tmpfile=${tmpfile}"
log_local ""
log_local "Environment:"
log_local "$(env)"
log_local ""


### Determine our operation mode, and handle the modes.
case ${#} in
     0)
        # This case is for "backend discovery mode."
        echo "direct ${backend_name} \"Unknown\" \"cups-programme: Print to file and open in programme. DeviceURI example: ${backend_name}:/usr/bin/gimp?u=<user>&D=:0.0&%s\". See documentation!"
        exit 0
     ;;
     5)
        # Backend needs to read from stdin if number of arguments is 5.
        log_cups "Writing print job ${jobid} output to ${tmpfile} ..."
        cat - > "${tmpfile}"
        # Make it world read- and writeable, to be able to work with it as another user.
        chmod 666 "${tmpfile}"
        log_cups "Print job ${jobid} output written to ${tmpfile}."
     ;;
     6)
        # Backend needs to read from file if number of arguments is 6.
        log_cups "Writing print job ${jobid} output to ${tmpfile} ..."
        cat "${6}" > "${tmpfile}"
        # Make it world read- and writeable, to be able to work with it as another user.
        chmod 666 "${tmpfile}"
        log_cups "Print job ${jobid} output written to ${tmpfile}."
     ;;
     1)
       case "$1" in
         '-V'|'-version'|'--version')
           echo "${VERSION}"
           exit 0
         ;;
         *)
          # This is dirty, since this section is twice in this script. Fix it.
          stderr "$0: Error: Called with incorrect number ($#) of arguments."
          stderr ""
          stderr "Usage:"
          stderr ""
          stderr " $0 <job-ID> <user> <jobtitle> <copies> <joboptions> [<jobfile>]"
          stderr ""
          stderr "OR (for backend discovery mode):"
          stderr ""
          stderr "  $0"
          stderr ""
          stderr "OR (to retrieve the version number):"
          stderr ""
          stderr "  $0 -V | -version | --version"
          stderr ""
          stderr ""
          stderr "(Install this as CUPS backend to '/usr/lib/cups/backend/${backend_name}'.)"
          stderr "(Read the comment in $0 to see how to set this up.)"

          error "$0 called with $# arguments. Unsupported mode. Aborting."

          exit 11
         ;;
       esac
     ;;
     2|3|4|*)
        # This is dirty, since this section is twice in this script. Fix it.
        stderr "$0: Error: Called with incorrect number ($#) of arguments."
        stderr ""
        stderr "Usage:"
        stderr ""
        stderr " $0 <job-ID> <user> <jobtitle> <copies> <joboptions> [<jobfile>]"
        stderr ""
        stderr "OR (for backend discovery mode):"
        stderr ""
        stderr "  $0"
        stderr ""
        stderr "OR (to retrieve the version number):"
        stderr ""
        stderr "  $0 -V | -version | --version"
        stderr ""
        stderr ""
        stderr "(Install this as CUPS backend to '/usr/lib/cups/backend/${backend_name}'.)"
        stderr "(Read the comment in $0 to see how to set this up.)"
        
        error "$0 called with $# arguments. Unsupported mode. Aborting."
        
        exit 11
     ;;
esac

# Postpone the logging to cups until here, because only when we reached up to here we are correctly be running as a filter.
info "$0 started at ${tstamp}. Our log file is: ${logfile}."

# Unset variables to be read from $conffile first, to be safe from cases when they hang around in the environment.
unset su_variant
unset askpass_cmd
if [ -e "${conffile}" ]; then
  log_local "Reading ${conffile}"
  . "${conffile}" || {
    error "$0: Error while reading ${conffile}."
  }
else
  warn "$0: ${conffile} not present."
fi



su_nogroup_error() {
  error "$0: Error: Specified to run the command under a specific group, but su_variant '${su_variant}' does not support setting the group. Aborting."
  exit 51
}

check_su_group_root() {
  if [ ! "$(id -u)" -eq 0 ]; then
    error "$0: Error: Specified to run the command under a specific group, but that is only possible as root. We are run as user $(id -un)($(id -u)). Aborting."
    exit 43
  fi
}

check_log_su_cmd() {
  # $1: Check for presence of the executable.
  if ! /usr/bin/which "$1" >/dev/null 2>&1; then
    error "$0: Error: The command '$1', specified by su_variant '${su_variant}', could not be found. Aborting."
    exit 41
  fi
}

check_log_cmd() {
  # $1: Check for presence of the executable.
  if ! /usr/bin/which "$1" >/dev/null 2>&1; then
    error "$0: Error: The command '$1' could not be found. Aborting."
    exit 42
  fi
}

if [ -v user ] || [ -v group ]; then
  if [ ! -v su_variant ]; then
    error "$0: Error: The command should be run as a specific user or group, but 'su_variant' has not been set. Please check ${conffile}. Aborting."
    exit 31
  fi
  case "${su_variant}" in
    'su')
      su_cmd='su'
      su_opts="-c \"${cmd@Q} ${cmd_args[@]@Q}\""
      if [ -v group ]; then
        check_su_group_root
        su_opts+=" -g ${group@Q}"
      fi
      if [ -v user ]; then
        su_opts+=" ${user@Q}"
      fi
    ;;
    'sudo')
      su_cmd='sudo'
      su_opts='-H'
      if [ -v group ]; then
        check_su_group_root
        su_opts+=" -g ${group@Q}"
      fi
      if [ -v user ]; then
        su_opts+=" -u ${user@Q}"
      fi
      su_opts+=" ${cmd@Q} ${cmd_args[@]@Q}"
    ;;
    'sudo-askpass')
      if [ ! -v askpass_cmd ]; then
        error "$0: Error: su_variant '${su_variant}' was specified, which requires the variable 'askpass_cmd' be (correctly) set in '${conffile}'. But it isn't. Aborting."
        exit 35
      fi
      # export SUDO_ASKPASS=${askpass_cmd@Q}
      su_cmd="SUDO_ASKPASS=${askpass_cmd@Q} sudo"
      su_opts='-A -H'
      if [ -v group ]; then
        check_su_group_root
        su_opts+=" -g ${group@Q}"
      fi
      if [ -v user ]; then
        su_opts+=" -u ${user@Q}"
      fi
      su_opts+=" ${cmd@Q} ${cmd_args[@]@Q}"
    ;;
    'kdesu')
      su_cmd='kdesu'
      su_opts='-n -t'
      if [ -v group ]; then
        su_nogroup_error
      fi
      if [ -v user ]; then
        su_opts+=" -u ${user@Q}"
      fi
      su_opts+=" -c ${cmd@Q} ${cmd_args[@]@Q}"
    ;;
    'kdesudo')
      su_cmd='kdesudo'
      su_opts="--nograb -n -t --comment '$0: Enter password.'"
      if [ -v group ]; then
        su_nogroup_error
      fi
      if [ -v user ]; then
        su_opts+=" -u ${user@Q}"
      fi
      su_opts+=" -c ${cmd@Q} ${cmd_args[@]@Q}"
    ;;
    *)
      error "$0: Error: Unsupported su_variant '${su_variant}' provided. Aborting."
      exit 33
    ;;
  esac
else
  su_cmd='sh'
  su_opts="-c ${cmd@Q} ${cmd_args[@]@Q}"
fi

if [ -v display ]; then
  log_local "exporting DISPLAY=${display}"
  export DISPLAY="${display}"
fi

notice "$0: Running 'bash -c \"${su_cmd} ${su_opts} >> ${logfile@Q} 2>&1\"'..."

log_local ""
log_local "--- Output of the command run (stdout and stderr combined): ---"
set +e
bash -c "${su_cmd} ${su_opts} >> ${logfile@Q} 2>&1"
cmd_exitcode=$?
set -e
log_local "--- End of the output of the command run. ---"
log_local ""

if [ ${cmd_exitcode} -eq 0 ]; then
  notice "$0: Run of 'bash -c \"${su_cmd} ${su_opts} >> ${logfile@Q} 2>&1\"' finished with exitcode ${cmd_exitcode}."
  notice "See '${logfile}' for combined stdout and stderr."
else
  error "Run of 'bash -c \"${su_cmd} ${su_opts} >> ${logfile@Q} 2>&1\"' FAILED with exitcode ${cmd_exitcode}."
  error "See '${logfile}' for combined stdout and stderr."
fi

log_local "Removing ${tmpfile}."
rm -f "${tmpfile}"

info "End of $0 run."
log_cups ''

exit "${cmd_exitcode}"
