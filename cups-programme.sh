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
VERSION=0.2.2

# Abort on error
set -e

# The name of this backend. Do not change.
backend_name='cups-programme'

# The config file
conffile=/etc/cups/cups-programme.conf

# Timestamp
tstamp="$(date '+%Y-%m-%d_%T%z')"

case "$1" in
  '-V'|'-version'|'--version')
    echo "${VERSION}"
    exit 0
  ;;
esac


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


# Creating our logfile name:
logfile="/tmp/${backend_name}.${jobid}.log"

# Creating the name of the temporary file, for CUPS print output:
tmpfile="/tmp/${backend_name}_job-${jobid}_${jobtitle}.ps"

# The final outpuf file name before executing the programme; without suffix (suffix will be determined later):
outfile_prefix="/tmp/${backend_name}.${jobid}"


### Determine our operation mode, and handle the modes.
case ${#} in
  0)
    # This case is for "backend discovery mode."
    echo "direct ${backend_name} \"Unknown\" \"cups-programme: Print to file and open in programme. DeviceURI example: ${backend_name}:/usr/bin/gimp?u=<user>&DISPLAY=%C0.0&%s\". See documentation!"
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
  *)
    # This one should not be reached in normal operation.
    mode='unsupported'
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

# If possible, make the tmpfile write- and readable by all, for convenience (e.g. to easily remove it in case it is leftover).
chmod a+wr "${tmpfile}" || true

# Postpone this logging to here, because only when we reached up to here we are correctly be running as a filter.
log_local ""
info "$0 started at ${tstamp}. Our log file is: ${logfile}."
log_local ""
# If possible, make the logfile write- and readable by all, for convenience (e.g. to easily remove it in case it is leftover).
chmod a+wr "${logfile}" || true


### Read the configuration file.
# Unset variables to be read from $conffile first, to be safe from cases when they hang around in the environment.
unset su_variant
unset askpass_cmd
unset image_converter
if [ -e "${conffile}" ]; then
  log_local "Reading configuration file '${conffile}' ..."
  . "${conffile}" || {
    error "$0: Error while reading ${conffile}."
  }
  log_local "Configuration file read."
else
  warn "$0: Configuration file '${conffile}' not present."
fi
log_local ""


### Parse $DEVICE_URI.
# 
# $DEVICE_URI format:
# 
#   ${backend_name}:<command>?u=<user>&g=<group>&D=<display>&t=<filetype>&<variable>=<value>&<variable>=<value>&<argument>&<argument>...
# 
# All arguments, including the 'u=<user>', 'g=<group>', 'D=<display>'
# and 't=<filetype>, are optional.
#
# The following replacements will be carried out for '<command>' and all
# options except 't=<filetype>':
#   - '%.' -> ' '
#   - '%_' -> '-'
#   - '%P' -> '|'
#   - '%B' -> '\'
#   - '%H' -> '#'
#   - '%Q' -> '?'
#   - '%A' -> '&'
#   - '%C' -> ':'
#   - '%T' -> '''
#   - '%G' -> '"'
#   - '%E' -> '='
#   - '%M' -> '@'
#   - '%%' -> '%'
#   - '%s' -> "${outfile}" (The, probably converted, output from CUPS to
#                           open)
# The replacements will be carried out after we have parsed the options,
# so '%E' can be used to escape a '=' from our parser.
# 
# The programme will be invoked with the specified arguments.

# Getting the command from $DEVICE_URI:
cmd="$(echo "${DEVICE_URI}" | sed "s|^${backend_name}":'||g' | sed 's|?.*$||')"

# Getting the raw options, arguments, ... from $DEVICE_URI:
argstr="$(echo "${DEVICE_URI}" | sed -n 's|^[^?]*?\(.*\)$|\1|p')"

# Taking the raw options, arguments, ... apart:
IFS='&' read -r -a argv <<< "${argstr}"

# Parse the options:
cmd_args=()
unset user
unset group
unset display
unset filetype
env_vars=()
# Have this as function that we will call, so that we can make use of 'shift'.
parse_argv() {
  while [ $# -gt 0 ]; do
    _arg="$1"
    case "${_arg}" in
      u=*)
        user="${_arg#u=}"
        if [ "X${user}" == "X.CUPSUSER" ]; then
          user="${cupsuser}"
        fi
        log_local "  Parsed 'u='-option. User: '${user}'."
      ;;
      g=*)
        group="${_arg#g=}"
        log_local "  Parsed 'g='-option. Group: '${group}'."
      ;;
      D=*)
        display="${_arg#D=}"
        log_local "  Parsed 'D='-option. Display: '${display}'."
      ;;
      t=*)
        filetype="${_arg#t=}"
        log_local "  Parsed 't='-option. filetype: '${filetype}'."
      ;;
      ?*=*)
        env_vars+=("${_arg}")
        log_local "  Parsed variable assignment '${_arg}'."
      ;;
      *)
        arg="${_arg}"
        log_local "  Parsed next argument. It is: '${arg}'."
        cmd_args+=("${arg}")
      ;;
    esac
    shift
  done
}
log_local "Parsing options from DEVICE_URI: ${argv[@]@Q} ..."
parse_argv "${argv[@]}"
log_local "Parsed options."
log_local ""

# If filetype has not been specified, then default to PostScript:
if [ ! -v filetype ]; then
  filetype='ps'
fi

# Set outfile:
outfile="${outfile_prefix}.${filetype}"

# Now, after $outfile is set, do the string replacements:
replace_strings() {
  replace '%%' '%' '%.' ' ' '%_' '-' '%P' '|' '%B' '\' '%H' '#' '%Q' '?' '%A' '&' '%C' ':' '%G' '"' '%T' "'" '%E' '=' '%M' '@' '%s' "${outfile}"
}
if [ -v cmd ];     then cmd="$(echo "${cmd}"         | replace_strings)"; fi
if [ -v user ];    then user="$(echo "${user}"       | replace_strings)"; fi
if [ -v group ];   then group="$(echo "${group}"     | replace_strings)"; fi
if [ -v display ]; then display="$(echo "${display}" | replace_strings)"; fi
cmd_args_replaced=()
for _arg in "${cmd_args[@]}"; do
  cmd_args_replaced+=("$(echo "${_arg}" | replace_strings)")
done
# Exporting environment variables after replacements.
for _env in "${env_vars[@]}"; do
  _var="$(echo "${_env%%=*}" | replace_strings)"
  _val="$(echo "${_env#?*=}" | replace_strings)"
  log_local "Exporting environment variable '${_var}=${_val}'."
  declare -g "${_var}=${_val}"
  export "${_var}"
done
log_local ""



### Log some debugging information
log_local "--- Some information: ---"
log_local ""
log_local "We were called as:"
log_local "  $0 $@"
log_local ""
log_local "Number of command line arguments passed to us: $#".
log_local ""
log_local "Information passed from CUPS:"
log_local "  - backend:    ${backend}"
log_local "  - jobid:      ${jobid}"
log_local "  - cupsuser:   ${cupsuser}"
log_local "  - jobtitle:   ${jobtitle}"
log_local "  - jobcopies:  ${jobcopies}"
log_local "  - joboptions: ${joboptions}"
log_local "  - jobfile:    ${jobfile}"
log_local "  - DEVICE_URI: ${DEVICE_URI}"
log_local ""
log_local "Executable and arguments specified via \$DEVICE_URI":
log_local "  - command:                ${cmd}"
log_local "  - command arguments:      ${cmd_args_replaced[@]}"
log_local "  - # of command arguments: ${#cmd_args_replaced[@]}"
log_local ""
log_local "Variables extracted from \$DEVICE_URI:"
if [ -v user ];     then log_local "  - user:     ${user}";     else log_local "  - (Variable 'user' is not set.)";     fi
if [ -v group ];    then log_local "  - group:    ${group}";    else log_local "  - (Variable 'group' is not set.)";    fi
if [ -v display ];  then log_local "  - display:  ${display}";  else log_local "  - (Variable 'display' is not set.)";  fi
if [ -v filetype ]; then log_local "  - filetype: ${filetype}"; else log_local "  - (Variable 'filetype' is not set.)"; fi
log_local ""
log_local "Variables specified in the configuration file:"
log_local "  - su_variant:      ${su_variant}"
log_local "  - askpass_cmd:     ${askpass_cmd}"
log_local "  - image_converter: ${image_converter}"
log_local ""
log_local "Files:"
log_local "  - conffile: ${conffile}"
log_local "  - logfile:  ${logfile}"
log_local "  - tmpfile:  ${tmpfile}"
log_local "  - outfile:  ${outfile}"
log_local ""
# log_local "Environment:"
# log_local "$(env)"
# log_local ""
log_local "--- End of some information. ---"
log_local ""


### Convert CUPS' output. $outfile should already be set (directly after parsing $DEVICE_URI).
case "${filetype}" in
  'ps')
    notice "Keeping PostScript format, '${outfile}'."
    mv -f "${tmpfile}" "${outfile}"
  ;;
  'pdf')
    notice "Converting to pdf '${outfile}' ..."
    ps2pdf "${tmpfile}" "${outfile}"
    rm -f "${tmpfile}"
  ;;
  'svg')
    notice "Converting to svg '${outfile}' ..."
    ps2pdf "${tmpfile}" "${tmpfile}.pdf"
    pdf2svg "${tmpfile}.pdf" "${outfile}"
    rm -f "${tmpfile}" "${tmpfile}.pdf"
  ;;
  'png'|'jpg'|'gif'|'tif')
    if [ ! -v image_converter ]; then
      error "$0: A pixel graphic file type, '${filetype}', was requested to convert to. When converting to pixel graphic, 'image_converter' needs to be specified in '${conffile}', but it is not. Aborting."
      exit 63
    fi
    case "${image_converter}" in
      'im')
        _convert="convert"
      ;;
      'gm')
        _convert="gm convert"
      ;;
      *)
        error "$0: Unsupported image_converter '${image_converter}'. Aborting."
        exit 62
      ;;
    esac
    case "${filetype}" in
      'png'|'jpg')
        # ImageMagick will convert multiple page input to different layers in tif and gif, but not in png and jpg. To ensure only one output file with png and jpg, just process the first page of input in this case.
        _pages='[0]'
      ;;
    esac
    case "${filetype}" in
      'png')
        _convert_opts="-quality 100"
      ;;
      'jpg')
        _convert_opts="-quality 65"
      ;;
      'tif')
        _convert_opts="-compress LZW -quality 100"
      ;;
      'gif')
        _convert_opts=""
      ;;
    esac
    notice "Converting to ${filetype} '${outfile}' with '${_convert}' ..."
    ${_convert} -density 300 "${tmpfile}${_pages}" ${_convert_opts} "${outfile}"
    rm -f "${tmpfile}"
  ;;
  *)
    error "$0: File format '${filetype}' not supported. Aborting."
    exit 61
  ;;
esac
log_local ""

# If possible, make the outfile write- and readable by all, for convenience (e.g. to easily remove it in case it is leftover).
chmod a+wr "${outfile}" || true



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
      su_opts="-c \"${cmd@Q} ${cmd_args_replaced[@]@Q}\""
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
      su_opts+=" ${cmd@Q} ${cmd_args_replaced[@]@Q}"
    ;;
    'sudo-askpass')
      if [ ! -v askpass_cmd ]; then
        error "$0: Error: su_variant '${su_variant}' was specified, which requires the variable 'askpass_cmd' be (correctly) set in '${conffile}'. But it isn't. Aborting."
        exit 35
      fi
      su_cmd="SUDO_ASKPASS=${askpass_cmd@Q} sudo"
      su_opts='-A -H'
      if [ -v group ]; then
        check_su_group_root
        su_opts+=" -g ${group@Q}"
      fi
      if [ -v user ]; then
        su_opts+=" -u ${user@Q}"
      fi
      su_opts+=" ${cmd@Q} ${cmd_args_replaced[@]@Q}"
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
      su_opts+=" -c ${cmd@Q} ${cmd_args_replaced[@]@Q}"
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
      su_opts+=" -c ${cmd@Q} ${cmd_args_replaced[@]@Q}"
    ;;
    *)
      error "$0: Error: Unsupported su_variant '${su_variant}' provided. Aborting."
      exit 33
    ;;
  esac
else
  su_cmd='sh'
  su_opts="-c ${cmd@Q} ${cmd_args_replaced[@]@Q}"
fi

if [ -v display ]; then
  log_local "exporting DISPLAY=${display}"
  log_local ""
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
  log_local ""
else
  error "Run of 'bash -c \"${su_cmd} ${su_opts} >> ${logfile@Q} 2>&1\"' FAILED with exitcode ${cmd_exitcode}."
  error "See '${logfile}' for combined stdout and stderr."
  log_local ""
fi

log_local "Removing ${outfile}."
log_local ""
rm -f "${outfile}"

info "End of $0 run."
log_cups ''

exit "${cmd_exitcode}"
