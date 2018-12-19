#!/bin/bash

_version=20181219.1

##### Dependencies. #####
#
# On Arch Linux, this script depends on the following packages (in brackets the bare commands it uses):
#   * bash: For running this script. ('bash')
#   * dnsmasq: For DHCP and DNS. ('dnsmasq')
#   * iptables: For configuring NAT/ masquerading. ('iptables')
#   * net-tools: For configuring IP information of the network interface. ('ifconfig')
#   * wireless_tools: For configuration of wireless network interface. ('iwconfig')
#   * wpa_supplicant: For WPA-encryption. ('wpa_supplicant', 'wpa_passphrase')
#   * ... and standard tools like grep, sed, awk ...
#
##### #####


# set -e

_datetime="$(date +%Y-%m-%d_%H-%M-%S)"

# Default values. Can be overridden by commandline options.
_iface_default="wlan0"
_ip_default="192.168.101.3"
_netmask_default="255.255.255.0"
_out_iface_all_default="true"
_out_iface_default="<all>"
_dhcprange_lower_suffix_default="121"
_dhcprange_upper_suffix_default="199"
_macaddress_change_default="false"
_macaddress_default='<not change>'
_essid_default="adhoc_network"
_channel_default="8"
_encryption_default="off"
_enckey_default="please_specify_a_non_default_key"
_wifimode_default="ad-hoc"
_no_wifi_default="false"
_no_ipconfig_default="false"
_no_nat_default="false"
_tftp_root_default="/tftpboot"
_no_tftp_default="false"
_verbose_default="false"
_debug_default="false"
_rundir_base_default="/var/run/adhocspot"


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
    msg "$@"
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

make_newip_from_suffix() {
  # Takes as $1 an IPv4-address, as $2 a last part of an IPv4-address, and replaces the last part of $1 with $2.
  if [ $# -lt 2 ]; then
    exiterror "$0: In function 'make_newip_from_suffix': Error: Need IP-address and a suffix as options."
  fi

  _ip="$1"
  _sfx="$2"

  echo "$(echo "${_ip}" | awk -F. '{print $1"."$2"."$3}').${_sfx}"
}

get_macaddress() {
  # Returns the MAC-address of the interface specified in $1.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'get_macaddress': Error: Need to specify a network interface as option."
  fi
  
  ifconfig "$1" | grep -E '\<ether\>' | sed 's|^.*ether[[:space:]]*\([0-9a-f:]*\)[[:space:]].*$|\1|g'
}

is_interface_up() {
  # Returns 0 if interface $1 is up, otherwise 1.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'is_interface_up': Error: Need to specify a network interface as option."
  fi
  
  ifconfig "$1" | tr '[[:space:]]' '\n' | grep 'flags=' | grep -q UP
}

set_macaddress() {
  # Sets the MAC-address of the network interface $1 to $2.
  if [ $# -lt 2 ]; then
    exiterror "$0: In function 'set_macaddress': Error: Need interface and MAC-address as options."
  fi
  
  verbose "Setting MAC address of $1 to $2."
  
  if is_interface_up "$1"; then
    _isup=true
  else
    _isup=false
  fi
  
  # debug "DEBUG: Interface is up, need to be temporarily down to change MAC address."
  if "${_isup}"; then
    ifconfig "$1" down
  fi
  # debug "DEBUG: Interface was brought down. Now changing MAC address."
  ifconfig "$1" hw ether "$2"
  # debug "DEBUG: Bringing interface up again."
  if "${_isup}"; then
    ifconfig "$1" up
  fi
  # debug "DEBUG: Interface brought up."
}

get_netmask() {
  # Returns the netmask of network interface $1.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'get_netmask': Error: Need to specify a network interface as option."
  fi

  _nmask="$(ifconfig "$1" | grep -E '\<netmask\>' | sed 's|^.*netmask[[:space:]]*\([0-9a-f\.]*\)[[:space:]].*$|\1|g')"
  echo "${_nmask}"
}

get_ipaddress() {
  # Returns the IP address of network interface $1.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'get_ipaddress': Error: Need to specify a network interface as option."
  fi
  
  _ipaddr="$(ifconfig "$1" | grep -E '\<inet\>' | sed 's|^.*inet[[:space:]]*\([0-9a-f\.]*\)[[:space:]].*$|\1|g')"
  if [ -z "${_ipaddr}" ]; then
    _ipaddr='0.0.0.0'
  fi
  
  echo "${_ipaddr}"
}

get_ipconfig() {
  # Outputs the ip config state of network interface $1. Output format: 'inet <ip> netmask <netmask> [up/down]' (so we could direktly feed back into ifconfig).
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'get_ipconfig': Error: Need to specify a network interface as option."
  fi
  
  if is_interface_up "$1"; then
    _updown='up'
  else
    _updown='down'
  fi
  
  _ipaddr="$(get_ipaddress "$1")"
  _nmask="$(get_netmask "$1")"
  
  if [ -z "${_ipaddr}" ]; then
    _ipaddr='0.0.0.0'
  fi
  if [ -n "${_nmask}" ]; then
    _nmtext="netmask ${_nmask} "
  else
    _nmtext=""
  fi
  
  echo "inet ${_ipaddr} ${_nmtext}${_updown}"
}

get_nat_interfaces() {
  # Returns a newline-separated list of interfaces to add masquerading to their postrouting queue. Examines $_out_iface_all: If $_out_iface_all is true, returns all available interfaces whose name does not start with 'lo'. Otherwise, returns ${_out_iface}.
  _nat_ifaces=""
  if "${_out_iface_all}"; then
    _nat_ifaces="$(ifconfig -a | grep -E '^[^[[:space:]]]*' | awk '{print $1}' | sed 's|\:$||g' | grep -vE '^lo')"
  else
    _nat_ifaces="${_out_iface}"
  fi
  echo "${_nat_ifaces}"
}

get_rp_filter_status() {
  # Arguments: $1: Space-, tab- or newline-separated list of interfaces to check rp_filter value.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'get_nat_status': Error: Need list of interfaces as option."
  fi
  for _nat_iface in $1; do
    echo "${_nat_iface} $(cat "/proc/sys/net/ipv4/conf/${_nat_iface}/rp_filter")"
  done
}

get_ipv4_forward_status() {
  cat "/proc/sys/net/ipv4/ip_forward"
} 

configure_nat() {
  # Arguments:
  # $1: Space-, tab- or newline-separated list of interfaces to add masquerading to their postrouting queue.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'configure_nat': Error: Need list of interfaces as option."
  fi
  get_rp_filter_status "$1" > "${_rp_filter_statusfile}"
  get_ipv4_forward_status > "${_ipv4_forward_statusfile}"
  verbose "Configuring IPv4 forwarding"
  echo 1 > /proc/sys/net/ipv4/ip_forward
  for _nat_iface in $1; do
    verbose "Configuring masquerading and disabling rp_filter on ${_nat_iface}."
    iptables -t nat -A POSTROUTING -j MASQUERADE -o "${_nat_iface}"
    echo 0 > "/proc/sys/net/ipv4/conf/${_nat_iface}/rp_filter"
  done
}

deconfigure_nat() {
  if [ -e "${_rp_filter_statusfile}" ]; then
    cat "${_rp_filter_statusfile}" | while read _line; do
      _nat_iface="$(echo "${_line}" | awk '{print $1}')"
      _rp_value="$(echo "${_line}" | awk '{print $2}')"
      verbose "Setting rp_filter to ${_rp_value} on ${_nat_iface}."
      echo "${_rp_value}" > "/proc/sys/net/ipv4/conf/${_nat_iface}/rp_filter"
    done
    rm -f "${_rp_filter_statusfile}"
  fi
  if [ -e "${_ipv4_forward_statusfile}" ]; then
    _fwd="$(cat "${_ipv4_forward_statusfile}")"
    verbose "Setting IPv4 forwarding to ${_fwd}."
    echo "${_fwd}" > /proc/sys/net/ipv4/ip_forward
    rm -f "${_ipv4_forward_statusfile}"
  fi
  verbose "Removing all entries from the 'nat' firewall table."
  iptables -t nat -F
}

configure_ip() {
  # Configures the network interface $1. Expects as argument $2 a string acceptible to ifconfig (e.g. of the format 'inet <IP> netmask <netmask> [up/down]').
  if [ $# -lt 2 ]; then
    exiterror "$0: In function 'configure_ip': Error: Need interface, and configuration as options."
  fi
  
  verbose "Setting network interface $1 to $2."
  ifconfig "$1" $2
}

configure_wifi_basics() {
  # Configures the WiFi interface $1 for mode $2, ESSID $3, channel $4.
  if [ $# -lt 4 ]; then
    exiterror "$0: In function 'configure_wifi_basics': Error: Need interface, mode, ESSID and channel as options."
  fi

  verbose "Configuring $1 for WiFi mode $2, ESSID $3 and channel $4."
  iwconfig "$1" mode "$2" essid "$3" channel "$4"
}

configure_wifi_wep() {
  # Configures the WiFi interface $1 for WEP-encryption with password $2.
  if [ $# -lt 2 ]; then
    exiterror "$0: In function 'configure_wifi_wep': Error: Need interface and WEP-password as options."
  fi
  
  verbose "Setting encryption of $1 to WEP restricted, with password $2."
  iwconfig "$1" key restricted s:"$2"
}

configure_wifi_wpa() {
  # Configures the WiFi interface $1 for WPA-encryption with ESSID $2 and password $3. $4 specifies the WiFi-Mode we operate (e.g. ad-hoc or master).
  if [ $# -lt 4 ]; then
    exiterror "$0: In function 'configure_wifi_wpa': Error: Need interface, ESSID, WEP-password and WiFi-mode as options."
  fi
  
  _wpaiface="$1"
  _wpaessid="$2"
  _wpapasswd="$3"
  _wpawifimode="$4"
  
  _wpadriver="wext"
  _wpapsk="$(wpa_passphrase "${_wpaessid}" "${_wpapasswd}" | grep -Ev '^[[:space:]]*\#' | grep '^[[:space:]]psk\=' | cut -d'=' -f2)"
  _wpa_group="$(id -gn)"
  
  case "${_wpawifimode}" in
    "ad-hoc")
      _mode=1
      _ap_scan=2
      _key_mgmt='WPA-NONE'
      _pairwise='NONE'
    ;;
    "master")
      exiterror "$0: Error: WPA encryption together with mode 'master' is not implemented yet. Aborting." 99
      _mode=1
      _ap_scan=1
      _key_mgmt='WPA-NONE'
      _pairwise='NONE'
    ;;
    "managed")
      _mode=0
      _ap_scan=1
      _key_mgmt='WPA-PSK'
      _pairwise='NONE'
    ;;
    *)
      exiterror "$0: In function 'configure_wifi_wpa': Error: Not supported WiFi-mode "${_wpawifimode}" specified."
    ;;
  
  esac
  
  _wpaconf="
    ctrl_interface=DIR=${_wpa_ctrl} GROUP=${_wpa_group}
    ap_scan=${_ap_scan}
    network={
      ssid=\"${_wpaessid}\"
      mode="${_mode}"
      proto=WPA
      key_mgmt=${_key_mgmt}
      pairwise=${_pairwise}
      group=TKIP
      psk=${_wpapsk}
    }
"

  if "${_debug}"; then
    _wpadebug="-dd"
  elif "${_verbose}"; then
    _wpadebug="-d"
  else
    _wpadebug=""
  fi
  
  verbose "Starting wpa_supplicant for interface ${_wpaiface}."
  debug ""
  debug "=== Using the following configuration file for wpa_supplicant: ==="
  debug ""
  debug "${_wpaconf}"
  debug ""
  debug "=== End of wpa_supplicant's config file. ==="
  debug ""
  echo "${_wpaconf}" | wpa_supplicant ${_wpadebug} -P "${_wpa_pidfile}" -t -f "${_wpa_logfile}" -B -c"/dev/stdin" -i "${_wpaiface}" -D "${_wpadriver}" || {
    _wpa_error="$?"
    exiterror "$0: Error: wpa_supplicant failed to start with exitcode ${_wpa_error}. Aborting." "${_wpa_error}"
  }
}

configure_wifi() {
  # Configures the WiFi interface. Arguments:
  # $1: Interface
  # $2: Mode
  # $3: ESSID
  # $4: Channel
  # $5: Encryption type
  # $6: Encryption password
  
  if [ $# -lt 6 ]; then
    exiterror "$0: In function 'configure_wifi': Error: Need interface, mode, ESSID, channel, encryption type and encryption password as options."
  fi
  
  _wifi_iface="$1"
  _wifi_mode="$2"
  _wifi_essid="$3"
  _wifi_channel="$4"
  _wifi_enctype="$5"
  _wifi_encpasswd="$6"
  
  configure_wifi_basics "${_wifi_iface}" "${_wifi_mode}" "${_wifi_essid}" "${_wifi_channel}"
  
  case "${_wifi_enctype}" in
    "wep")
      configure_wifi_wep "${_wifi_iface}" "${_wifi_encpasswd}"
    ;;
    "wpa")
      configure_wifi_wpa "${_wifi_iface}" "${_wifi_essid}" "${_wifi_encpasswd}" "${_wifi_mode}"
    ;;
    "off")
      true # Do not configure encryption.
    ;;
    *)
      exiterror "$0: In function 'configure_wifi': Selected unsupported encryption type '${_wifi_enctype}'. Aborting."
    ;;
  esac
}

start_dnsmasq() {

  _dnsmasq_iface="${_iface}"

  _dnsmasq_tftproot="${_tftp_root}"
  
  
  if [ "$(grep dnsmasq /etc/passwd | cut -d':' -f1 )" == dnsmasq ]; then
    _dnsmasq_user=dnsmasq
  else
    _dnsmasq_user=nobody
  fi

  if [ "$(grep dnsmasq /etc/group | cut -d':' -f1 )" == dnsmasq ]; then
    _dnsmasq_group=dnsmasq
  else
    _dnsmasq_group=nobody
  fi

  if "${_debug}"; then
    _dnsmasq_debug_options=(
      "--log-queries=extra"
      "--log-dhcp"
    )
  elif "${_verbose}"; then
    _dnsmasq_debug_options=(
      "--log-dhcp"
    )
  else
    _dnsmasq_debug_options=()
  fi
  
  _dnsmasq_general_options=(
    "--no-hosts"
    "--log-facility=${_dnsmasq_logfile}"
    "--pid-file=${_dnsmasq_pidfile}"
    "--user=${_dnsmasq_user}"
    "--group=${_dnsmasq_group}"
    "--interface=${_dnsmasq_iface}"
    "--bind-dynamic"
    # "--bind-interfaces"
    "--dhcp-range=${_dhcprange_lower},${_dhcprange_upper},24h"
    "--read-ethers"
    "--conf-file=/dev/null"
  )
  if "${_no_tftp}"; then
    _dnsmasq_tftp_options=(
    )
  else
    _dnsmasq_tftp_options=(
      "--enable-tftp"
      "--tftp-root=${_dnsmasq_tftproot}"
      "--tftp-no-fail"
    )
  fi
  
  verbose "Starting dnsmasq."
  dnsmasq "${_dnsmasq_debug_options[@]}" "${_dnsmasq_general_options[@]}" "${_dnsmasq_tftp_options[@]}" || {
    _dnsmasq_error="$?"
    exiterror "$0: Error: dnsmasq failed to start with exitcode ${_dnsmasq_error}. Aborting." "${_dnsmasq_error}"
  }
  
}

kill_by_pidfile() {
  # Kills a process by the PID within the file $1. Optional argument $2: A 'fancy name' of the process to use in error messages.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'kill_by_pidfile': Error: Need a PID-file as option."
  fi
  
  if [ $# -ge 2 ]; then
    _fancyname="$2"
  else
    _fancyname="process"
  fi

  _pid="$(cat "$1")"
  
  verbose "Killing ${_fancyname} (PID ${_pid})."
  
  if [ -d "/proc/${_pid}" ]; then
    kill "${_pid}" || {
      kill -9 "${_pid}" || {
        errmsg "$0: Failed to kill ${_fancyname} (PID "${_pid}")".
      }
    }
  else
    errmsg "$0: ${_fancyname}'s PID-file $1 is present, but no process under that PID (${_pid}) is running."
  fi

}

string_whitelist() {
  # Checks the string $1 against a whitelist: Returns one if the string passes, zero if it contains any character not in the whitelist.
  # As optional argument $2 a whitelist to be fed to tr can be used, if not specified a default is used.
  if [ $# -lt 1 ]; then
    exiterror "$0: In function 'string_whitelist': Error: Need a string to test as option."
  fi

  if [ $# -ge 2 ]; then
    _whitelist="$2"
  else
    _whitelist='[a-zA-Z0-9\._\-]'
  fi

  if [ -z "$(echo "$1" | tr -d "${_whitelist}")" ]; then
    return 0
  else
    return 1
  fi
}


_iface="${_iface_default}"
_ip="${_ip_default}"
_netmask="${_netmask_default}"
_out_iface_all="${_out_iface_all_default}"
_out_iface="${_out_iface_default}"
# _dhcprange_lower is set after parsing the options.
# _dhcprange_upper is set after parsing the options.
_macaddress_change="${_macaddress_change_default}"
_macaddress="${_macaddress_default}"
_essid="${_essid_default}"
_channel="${_channel_default}"
_encryption="${_encryption_default}"
_enckey="${_enckey_default}"
_wifimode="${_wifimode_default}"
_no_wifi="${_no_wifi_default}"
_no_ipconfig="${_no_ipconfig_default}"
_no_nat="${_no_nat_default}"
_tftp_root="${_tftp_root_default}"
_no_tftp="${_no_tftp_default}"
_verbose="${_verbose_default}"
_debug="${_debug_default}"
_rundir_base="${_rundir_base_default}"


printusage() {
  echo "Usage:"
  echo "  $0 action [arguments ...]"
  echo ""
  echo "Actions (exactly one required):"
  echo "  up   | start                      Start the thing."
  echo "  down | stop                       Stop the thing."
  echo "  stat | status | state | show      Show the status of the thing."
  echo "  -h   | --help | help              Print this message and exit."
  echo "  -V   | --version                  Print version number and exit. (Version is: '${_version}'.)"
  echo ""
  echo "Arguments (all optional):"
  echo "  -h   | --help | help              Print this message and exit."
  echo "  -V   | --version                  Print version number and exit. (Version is: '${_version}'.)"
  echo "  -v   | --verbose                  Print information as we go on/ start daemons verbosely."
  echo "  -d   | --debug                    Print debug output/ start daemons with debug output."
  echo "                                    Implies verbose."
  echo "  -i   | --iface <iface>            Interface on which the connection should be made available"
  echo "                                    (default: ${_iface_default})."
  echo "                                    Only characters out of the set [a-zA-Z0-9\._\-] are allowed."
  echo "  -ip  | --ip <ip>                  IPv4-address to configure this interface to (default: ${_ip_default})."
  echo "  -nm  | --netmask <netmask>        Netmask to use on this interface (default: ${_netmask_default})."
  echo "  -m   | --mac <MAC-address>        Set the MAC-address of this interface (defaults to the"
  echo "                                    interface's native MAC-address)."
  echo "  -ni  | --no-ipconfig              If specified, do not configure IP information for this"
  echo "                                    interface. Useful e.g. if already configured."
  echo "                                    Specifying this option, the following won't be configured:" 
  echo "                                    IP-address, netmask, MAC-address."
  echo "  -o   | --out-iface <iface>        If specified, configure masquerading ('NAT') only for"
  echo "                                    packages leaving on this interface (usually this is your"
  echo "                                    interface which connects to the internet, not the one"
  echo "                                    specified by the option '-i' / '--iface')."
  echo "                                    Only characters out of the set [a-zA-Z0-9\._\-] are allowed."
  echo "                                    If not specified, NAT will be configured on all available non-"
  echo "                                    local interfaces (determined by name starting with 'lo')."
  echo "  -nn  | --no-nat                   If specified, do not configure and deconfigure network address"
  echo "                                    translation, forwarding and masquerading."
  echo "  -dl  | --dhcp-lower <dhcp-ip>     Lower end of the range of IP-addresses to assign to"
  echo "                                    clients. The default is the first three numbers of our"
  echo "                                    IP-address, and then ${_dhcprange_lower_suffix_default}, e.g. $(make_newip_from_suffix "${_ip_default}" ${_dhcprange_lower_suffix_default})"
  echo "  -du  | --dhcp-upper <dhcp-ip>     Upper end of the range of IP-addresses to assign to"
  echo "                                    clients. The default is the first three numbers of our"
  echo "                                    IP-address, and then ${_dhcprange_upper_suffix_default}, e.g. $(make_newip_from_suffix "${_ip_default}" ${_dhcprange_upper_suffix_default})"
  echo "  -wm  | --wifi-mode <mode>         The WiFi-mode to set the interface to. Allowed modes:"
  echo "                                    'ad-hoc', 'master', 'managed'. (Default: ${_wifimode_default}.)"
  echo "  -e   | --essid <ESSID>            Set the WiFi ESSID to use (default: ${_essid_default})."
  echo "  -c   | --channel <wifi-channel>   Set the WiFi channel to use (default: ${_channel_default})."
  echo "  -enc | --enc <encryption-type>    Set the type of WiFi encryption to use. Possible values:"
  echo "                                    'off', 'wep', 'wpa'. (Default: ${_encryption_default})."
  echo "  -key | --key <enc-password>       Set the password to use for the WiFi encryption key"
  echo "                                    (default: ${_enckey_default})."
  echo "                                    NOTE: For WEP, the password has to be 5 or 13 characters long."
  echo "                                          For WPA, it has to be between 8 ans 63 characters long."
  echo "  -nw  | --no-wifi                  If specified, do not wifi-configure the interface. Useful"
  echo "                                    e.g. if already configured or it's not a WiFi interface."
  echo "                                    Specifying this option, the following won't be configured:" 
  echo "                                    WiFi-mode, ESSID, channel, encryption type, encryption key."
  echo "  -tf  | --tftp-root <dir>          Directory where to serve files for TFTP network boot from"
  echo "                                    (default: ${_tftp_root_default})"
  echo "  -nt  | --no-tftp                  If specified, do not provide a TFTP server."
  echo "  -r   | --rundir <directory>       Where to store and look for runtime information"
  echo "                                    (default: ${_rundir_base_default}). It get's created if nonextisting."
  echo ""
  echo "(Info: We were started at ${_datetime}.)"
}

_dhcp_lower_explicitly_set=false
_dhcp_upper_explicitly_set=false

if [ $# -lt 1 ]; then
  errmsg "$0: Error: Need at least one action specified."
  errmsg ""
  errmsg "Try option '-h' for a help."
  errmsg ""
  exiterror "Aborting." 10
fi

_action="$1"
case "${_action}" in
  "up"|"start")
    _action="up"
  ;;
  "down"|"stop")
    _action="down"
  ;;
  "stat"|"status"|"state"|"show")
    _action="status"
  ;;
  "-h"|"--help"|"help")
    printusage
    exit 0
  ;;
  "-V"|"--version")
    msg "${_version}"
    exit 0
  ;;
  *)
    errmsg "$0: Error: Invalid action '${_action}' specified."
    errmsg ""
    errmsg "$(printusage)"
    errmsg ""
    exiterror "Aborting." 10
  ;;
esac
shift

while [ $# -ge 1 ]; do
  
  case "$1" in
  
    "-h"|"--help"|"help")
      shift
      printusage
      exit 0
    ;;
    
    "-V"|"--version")
      shift
      msg "${_version}"
      exit 0
    ;;
    
    "-i"|"--iface")
      shift
      if [ $# -ge 1 ]; then
        _iface="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-i' or '--iface': Need to specify an interface."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 11
      fi
      shift
    ;;
    
    "-ip"|"--ip")
      shift
      if [ $# -ge 1 ]; then
        _ip="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-ip' or '--ip': Need to specify an IPv4-address."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 12
      fi
      shift
    ;;
    
    "-nm"|"--netmask")
      shift
      if [ $# -ge 1 ]; then
        _netmask="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-nm' or '--netmask': Need to specify a netmask."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 13
      fi
      shift
    ;;
    
    "-ni"|"--no-ipconfig")
      shift
      _no_ipconfig='true'
    ;;
    
    "-o"|"--out-iface")
      shift
      if [ $# -ge 1 ]; then
        _out_iface_all="false"
        _out_iface="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-o' or '--out-iface': Need to specify an interface."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 16
      fi
      shift
    ;;
    
    "-nn"|"--no-nat")
      shift
      _no_nat='true'
    ;;
    
    "-dl"|"--dhcp-lower")
      shift
      if [ $# -ge 1 ]; then
        _dhcprange_lower="$1"
        _dhcp_lower_explicitly_set=true
      else
        errmsg "$0: Error: Too few arguments for option '-dl' or '--dhcp-lower': Need to specify an IPv4-address."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 14
      fi
      shift
    ;;

    "-du"|"--dhcp-upper")
      shift
      if [ $# -ge 1 ]; then
        _dhcprange_upper="$1"
        _dhcp_upper_explicitly_set=true
      else
        errmsg "$0: Error: Too few arguments for option '-du' or '--dhcp-upper': Need to specify an IPv4-address."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 15
      fi
      shift
    ;;

    "-m"|"--mac")
      shift
      if [ $# -ge 1 ]; then
        _macaddress_change='true'
        _macaddress="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-m' or '--mac': Need to specify a MAC-address."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 17
      fi
      shift
    ;;

    "-wm"|"--wifi-mode")
      shift
      if [ $# -ge 1 ]; then
        _wifimode="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-wm' or '--wifi-mode': Need to specify a WiFi mode."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 18
      fi
      case "${_wifimode}" in
        "ad-hoc"|"master"|"managed")
          true # Everything is fine.
        ;;
        *)
          errmsg "$0: Not allowed WiFi-mode '${_wifimode}' specified for the '-wm' or '--wifi-mode'-option."
          errmsg ""
          errmsg "$(printusage)"
          errmsg ""
          exiterror "Aborting." 2
        ;;
      esac
      shift
    ;;

    "-e"|"--essid")
      shift
      if [ $# -ge 1 ]; then
        _essid="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-e' or '--essid': Need to specify a WiFi ESSID."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 19
      fi
      shift
    ;;

    "-c"|"--channel")
      shift
      if [ $# -ge 1 ]; then
        _channel="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-c' or '--channel': Need to specify a WiFi channel."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 20
      fi
      shift
    ;;

    "-enc"|"--enc")
      shift
      if [ $# -ge 1 ]; then
        _encryption="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-enc' or '--enc': Need to specify a WiFi encryption type."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 21
      fi
      case "${_encryption}" in
        "off"|"wep"|"wpa")
          true # Everything is fine.
        ;;
        *)
          errmsg "$0: Not allowed WiFi encryption type '${_encryption}' specified for the '-enc' or '--enc'-option."
          errmsg ""
          errmsg "$(printusage)"
          errmsg ""
          exiterror "Aborting." 2
        ;;
      esac

      shift
    ;;

    "-key"|"--key")
      shift
      if [ $# -ge 1 ]; then
        _enckey="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-key' or '--key': Need to specify a WiFi encryption password."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 22
      fi
      _enckeylength="$(echo -n "${_enckey}" | wc -c)"
      case "${_encryption}" in
        "wep")
          if [ ${_enckeylength} -ne 5 ] && [ ${_enckeylength} -ne 13 ]; then
            errmsg "$0: Error: For WEP-encryption, the length of the password has to be 5 or 13 characters. Yours was ${_enckeylength}."
            errmsg ""
            exiterror "Aborting." 2
          fi
        ;;
        "wpa")
          if [ ${_enckeylength} -lt 8 ] || [ ${_enckeylength} -gt 63 ]; then
            errmsg "$0: Error: For WPA-encryption, the length of the password has to be between 8 and 63 characters. Yours was ${_enckeylength}."
            errmsg ""
            exiterror "Aborting." 2
          fi
        ;;
        *)
          true # Everything is fine since there is no encryption, so the password does not matter.
        ;;
      esac
      shift
    ;;

    "-nw"|"--no-wifi")
      shift
      _no_wifi='true'
    ;;
    
    "-v"|"--verbose")
      shift
      _verbose='true'
    ;;
    
    "-d"|"--debug")
      shift
      _verbose='true'
      _debug='true'
    ;;
    
    "-tf"|"--tftp-root")
      shift
      if [ $# -ge 1 ]; then
        _tftp_root="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-tf' or '--tftp-root': Need to specify a directory."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 23
      fi
      shift
    ;;
    
    "-nt"|"--no-tftp")
      shift
      _no_tftp='true'
    ;;
    
    "-r"|"--rundir")
      shift
      if [ $# -ge 1 ]; then
        _rundir_base="$1"
      else
        errmsg "$0: Error: Too few arguments for option '-r' or '--rundir': Need to specify a directory."
        errmsg ""
        errmsg "$(printusage)"
        errmsg ""
        exiterror "Aborting." 24
      fi
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

if ! "${_dhcp_lower_explicitly_set}"; then
  _dhcprange_lower="$(make_newip_from_suffix "${_ip}" ${_dhcprange_lower_suffix_default})"
fi

if ! "${_dhcp_upper_explicitly_set}"; then
  _dhcprange_upper="$(make_newip_from_suffix "${_ip}" ${_dhcprange_upper_suffix_default})"
fi

string_whitelist "${_iface}" || {
  errmsg "$0: Error: Interface name '${_iface}' (specified via the '-i' or '--iface'-option or set as a default) contains invalid characters."
  errmsg "See help."
  exiterror "Aborting."
}

_instance="${_iface}"
_rundir="${_rundir_base}/${_instance}"

_wpa_logfilebase='wpa_supplicant.log'
_wpa_ctrlfilebase='wpa_supplicant.ctrl'
_wpa_pidfilebase='wpa_supplicant.pid'
_dnsmasq_logfilebase='dnsmasq.log'
_dnsmasq_pidfilebase='dnsmasq.pid'
_origmacfilebase='macaddress.orig'
_origifconfigfilebase='ifconfig.orig'
_wificonfiguredfilebase='wifi.orig'
_startedatfilebase='datetime.txt'
_rp_filter_statusfilebase='rp_filter.orig'
_ipv4_forward_statusfilebase='ipv4_forward.orig'
_nat_configuredfilebase='nat_configured'

_wpa_ctrl="${_rundir}/${_wpa_ctrlfilebase}"
_wpa_pidfile="${_rundir}/${_wpa_pidfilebase}"
_wpa_logfile="${_rundir}/${_wpa_logfilebase}"
_dnsmasq_logfile="${_rundir}/${_dnsmasq_logfilebase}"
_dnsmasq_pidfile="${_rundir}/${_dnsmasq_pidfilebase}"
_origmacfile="${_rundir}/${_origmacfilebase}"
_origifconfigfile="${_rundir}/${_origifconfigfilebase}"
_wificonfiguredfile="${_rundir}/${_wificonfiguredfilebase}"
_startedatfile="${_rundir}/${_startedatfilebase}"
_rp_filter_statusfile="${_rundir}/${_rp_filter_statusfilebase}"
_ipv4_forward_statusfile="${_rundir}/${_ipv4_forward_statusfilebase}"
_nat_configuredfile="${_rundir}/${_nat_configuredfilebase}"


if "${_verbose}"; then
  _mkdirverbose="-v"
  _rmverbose="-v"
fi

verbose "Started at ${_datetime}."

case "${_action}" in

  "up")
  
    mkdir ${_mkdirverbose} -p "${_rundir}"
    cd "${_rundir}"
    
    echo "${_datetime}" > "${_startedatfile}"
    
    if "${_macaddress_change}"; then
      get_macaddress "${_iface}" > "${_origmacfile}"
      set_macaddress "${_iface}" "${_macaddress}"
    fi

    if ! "${_no_wifi}"; then
      echo "We configured WiFi, so we take it down afterwards. (In fact, only the existence of this file matters, not it's content.)" > "${_wificonfiguredfile}"
      configure_wifi "${_iface}" "${_wifimode}" "${_essid}" "${_channel}" "${_encryption}" "${_enckey}"
    fi

    if ! "${_no_ipconfig}"; then
      get_ipconfig "${_iface}" > "${_origifconfigfile}"
      configure_ip "${_iface}" "inet ${_ip} netmask ${_netmask} up"
    fi
    
    if ! "${_no_nat}"; then
      _nat_interfaces="$(get_nat_interfaces | tr '\n' ' ')"
      configure_nat "${_nat_interfaces}"
      echo "${_nat_interfaces}" > "${_nat_configuredfile}"
    fi
    
    start_dnsmasq
    
  ;;

  "down")
    
    if [ -d "${_rundir}" ]; then
      cd "${_rundir}"
    else
      errmsg "$0: Cannot bring down, since specified runtime information directory ${_rundir} does not exist."
    fi
    
    if [ -e "${_nat_configuredfile}" ]; then
      deconfigure_nat
      rm -f "${_nat_configuredfile}"
    fi
    
    if [ -e "${_wpa_pidfile}" ]; then
      kill_by_pidfile "${_wpa_pidfile}" "wpa_supplicant"
      rm -f "${_wpa_pidfile}"
    fi
    
    if [ -e "${_dnsmasq_pidfile}" ]; then
      kill_by_pidfile "${_dnsmasq_pidfile}" "dnsmasq"
      rm -f "${_dnsmasq_pidfile}"
    fi
    
    if [ -e "${_origifconfigfile}" ]; then
      configure_ip "${_iface}" "$(cat "${_origifconfigfile}")"
      rm -f "${_origifconfigfile}"
    fi

    if [ -e "${_wificonfiguredfile}" ]; then
      configure_wifi "${_iface}" managed any 0 off "${_enckey_default}"
      rm -f "${_wificonfiguredfile}"
    fi
    
    if [ -e "${_origmacfile}" ]; then
      set_macaddress "${_iface}" "$(cat "${_origmacfile}")"
      rm -f "${_origmacfile}"
    fi
    
    rm -f "${_startedatfile}"
    rm -Rf "${_rundir}"/*
    rmdir ${_rmverbose} "${_rundir}"
  ;;

  "status")
    _instances="$(find "${_rundir_base}" -mindepth 1 -maxdepth 1 -type d)"
    if [ -z "${_instances}" ]; then
      echo "No runtime information present at '${_rundir_base}/'. Probably nothing running."
    else
      cd "${_rundir_base}"
      for _inst in ${_instances}; do
        _inst="$(basename "${_inst}")"
        _instdir="${_rundir_base}/${_inst}"
        echo "${_inst}:"
        {
          [ -e "${_instdir}/${_startedatfilebase}" ] && echo "Started: $(cat "${_instdir}/${_startedatfilebase}")" || true
          echo -n "$(get_ipconfig "${_inst}")"; [ -e "${_instdir}/${_origifconfigfilebase}" ] && {
            echo -n " (Old: $(cat "${_instdir}/${_origifconfigfilebase}")),"
          } || true
          echo -n " "
          echo -n "ether $(get_macaddress "${_inst}")"; [ -e "${_instdir}/${_origmacfilebase}" ] && {
            echo -n " (Old: $(cat "${_instdir}/${_origmacfilebase}"))"
          } || true
          echo ""
          
          [ -e "${_instdir}/${_nat_configuredfilebase}" ] && {
            echo -n "NAT: Configured by us for interfaces $(cat "${_instdir}/${_nat_configuredfilebase}")."
          } || {
            echo -n "NAT: Not configured by us."
          }
          echo ""
          
          [ -e "${_instdir}/${_wpa_pidfilebase}" ] && {
            echo -n "wpa_supplicant: PID: $(cat "${_instdir}/${_wpa_pidfilebase}"), "; [ -d "/proc/$(cat "${_instdir}/${_wpa_pidfilebase}")" ] && echo -n "Running." || echo -n "Not running."
          } || {
            echo -n "wpa_supplicant: Could not determine PID."
          }
          [ -e "${_instdir}/${_wpa_logfilebase}" ] && echo -n " Logfile: '${_instdir}/${_wpa_logfilebase}'." || true
          echo ""
          
          echo -n "dnsmasq: "; [ -e "${_instdir}/${_dnsmasq_pidfilebase}" ] && {
            echo -n "PID: $(cat "${_instdir}/${_dnsmasq_pidfilebase}"), "; [ -d "/proc/$(cat "${_instdir}/${_dnsmasq_pidfilebase}")" ] && echo -n "Running." || echo -n "Not running."
          } || {
            echo -n "Could not determine PID."
          }
          [ -e "${_instdir}/${_dnsmasq_logfilebase}" ] && echo -n " Logfile: '${_instdir}/${_dnsmasq_logfilebase}'." || true
          echo ""

        } | stdout_prefix "        "
        echo ""
      done
    fi
  ;;

  *)
    exiterror "$0: Error: Unknown action '${_action}'. Aborting."
  ;;

esac
