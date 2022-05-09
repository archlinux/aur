#!/usr/bin/bash

set -e
set -u

g_opt_F='t38fax' # function to run
g_opt_T='ttyT'
while getopts 'F:T:' opt; do
  case "${opt}" in
  F)g_opt_F="${OPTARG}";;
  T)g_opt_T="${OPTARG}";;
  esac
done
shift "$((OPTIND-1))"
unset opt OPTARG OPTIND

if [ "$(awk '{print int($1)}' '/proc/uptime')" -le 120 ]; then
  sleep 15
fi

g_lan_ip=''             # 0.0.0.0 if not multi homing. Else the default outgoing interface to prevent multiple registrations. Wihout a port mapping you get error: Call cleared due to loss of media flow.
g_pub_ip=''
case "${g_opt_T}" in
'ttyT')
  g_opt_Tx=''
  g_udid=''           # Usually an 10 or 11 digit phone number
  g_pw=''
  g_pub_port='5090'              # Always even number. Need router port mapping for this and RTP ports
  g_lan_ip+=":${g_pub_port}"
  g_sip_ip='sip.t38fax.com:5080' # port 5060,5090 returns SIP registration of sip:<dn>@sip.t38fax.com failed (513 Message Too Large)
# https://community.fortinet.com/t5/FortiGate/Technical-Tip-Session-timeout-settings/ta-p/191228
# https://community.fortinet.com/t5/FortiGate/Technical-Tip-Change-session-ttl-on-firewall-policy/ta-p/195971?externalID=FD35176
# https://www.hex64.net/blog/how-to-change-session-ttl-for-a-firewall-policy-in-fortigate/
# https://community.fortinet.com/t5/FortiGate/Technical-Tip-FortiGate-VIP-responds-to-telnet-on-port-5060-and/ta-p/195354
# Remove ALG and other SIP trash until nmap shows that the Fortiate ALG is no longer listening on ports 5060,2000
# Debug SIP registration problems with WireShark or tcpdump -v
  g_sip_expires='300'            # need router TTL adjustment to +60 seconds, 423 Interval Too Brief: find this value with tcpdump -v
  g_ctty=1
  ;;
'ttyAC')
  #g_pub_port='5082'
  #g_ctty=1
  #g_udid=''           # Usually an 10 or 11 digit phone number
  #g_pw=''
  g_pub_port='5104'
  g_ctty=6
  g_udid=''           # Usually an 10 or 11 digit phone number
  g_pw=''

  g_opt_Tx="${g_opt_T}"
  g_sip_ip='sip.example.com:5060'
  g_sip_expires='3600'
  g_lan_ip+=":${g_pub_port}"
  ;;
*) printf '%s not supported by %s\n' "${g_opt_T}" "$0"; exit 1;;
esac

# https://stackoverflow.com/questions/5533569/simple-method-to-shuffle-the-elements-of-an-array-in-bash-shell
shuffle() {
  local i tmp size max rand

  # $RANDOM % (i+1) is biased because of the limited range of $RANDOM
  # Compensate by using a range which is a multiple of the array size.
  size="${#dnsa[*]}"
  max="$(( 32768 / size * size ))"

  for ((i=size-1; i>0; i--)); do
    while (( (rand="$RANDOM") >= max )); do :; done
    rand="$(( rand % (i+1) ))"
    tmp="${dnsa[i]}" dnsa[i]="${dnsa[rand]}" dnsa[rand]="${tmp}"
  done
}

g_tmp='/tmp/devt38modem'
# https://unix.stackexchange.com/questions/7738/how-can-i-use-variable-in-a-shell-brace-expansion-of-a-sequence
test "${g_ctty}" -gt 0
for (( idx = 0; idx < "${g_ctty}"; idx++ )); do
  g_ptty+=("${g_opt_T}${idx}")
done
unset idx
g_uid='uucp'
g_gid='uucp'
g_watchdog="${g_tmp}/t38modem.watchdog.${g_opt_T}.txt"
g_restarts='Assertion fail|Call failed security check|has no compatible listener|failed .403'

_fn_cleantty() {
  if [ "${EUID}" -eq 0 ]; then
    rm -f "${g_ptty[@]/#/${g_tmp}/}" "${g_ptty[@]/#//dev/}"
  fi
}

mvwatchdog() {
  local wn="${g_watchdog##*/}"
  wn="${wn%.txt}-$(date +'%+4Y-%m-%d_%H-%M-%S').log"
  mv "${g_watchdog}" "/var/log/t38modem/${wn}"
}

_fn_watchdog() {
  if [ "${EUID}" -eq 0 ]; then
    if [ -s "${g_watchdog}" ]; then
      if ping -w '2' -q -n -c '1' 'sip.t38fax.com' > /dev/null; then
        systemctl stop 't38modem.service'
        mvwatchdog
        printf 'Restarting t38modem due to crash'
        systemctl start 't38modem.service'
        systemctl restart "${g_ptty[@]/#/faxgetty@}"
      fi
    elif ! pgrep -c -u "root,${g_uid}" 't38modem$' > /dev/null; then
      _fn_cleantty
    fi
  fi
}

# I tried to get Hylafax+ to run faxgetty with full paths. It just didn't work.
_fn_prep() {
  if [ "${EUID}" -eq 0 ]; then
    #chown "root:${g_gid}" "$0"
    chown "${g_uid}:root" "$0"
    chmod 700 "$0"
    umask 007
    mkdir -p "${g_tmp}"
    chown -R "${g_uid}:${g_gid}" "${g_tmp}"
    chmod 750 "${g_tmp}"
    cd '/dev'
    local p
    for p in "${g_ptty[@]}"; do
      ln -sf "${g_tmp}/${p}"
    done
  fi
}

_fn_t38fax() {
  local topts=()
  topts+=(
    # A registration is sent for every found interface so only enable the used interfaces.
    # No ipv6,tls,ws,wss listener unless used by the fax service.
    # Only a single ip on multi homing systems.
    --sip-listen='udp$'"${g_lan_ip}" # few services support tcp. some services won't allow multiple contact fields
    #--udp-base "$((g_pub_port+1))"
    #--udp-max  "$((g_pub_port+1))"
    #--portbase "$((g_pub_port))"
    #--portmax "$((g_pub_port+2+g_ctty*2))"
    --rtp-base "$((g_pub_port+2))"
    --rtp-max  "$((g_pub_port+2+g_ctty*2))" # 2 RTP ports per line
    --Use-ECM
    #--sip-proxy "${g_udid}:${g_pw}@${g_sip_ip}" # supported but not necessary
    "${g_ptty[@]/#/--ptty=+${g_tmp}/}"
    --route "modem:.*=sip:<dn>@${g_sip_ip}" # Hylafax send fax routes to sip.
    --route "sip:.*=modem:<dn>"           # Receive fax routes to Hylafax receive.
    --jitter   '80,80'
    --ssl-ca   '/etc/ssl/certs/ca-certificates.crt'
    --ssl-cert "${g_tmp}/t38modem_opal_certificate-${g_opt_T}.pem"
    --ssl-key  "${g_tmp}/t38modem_opal_private_key-${g_opt_T}.pem"
    --sip-register "${g_udid}@${g_sip_ip},${g_pw},,,,${g_sip_expires},public"
    #-u "${g_udid}"
    #-p "${g_pw}"
  )

  # Without one of these NAT handlers return connections fail and you get error: Call cleared due to loss of media flow.
  if :; then
    local dns dnsa=('api.ipify.org' 'ifconfig.me' 'icanhazip.com' 'ipinfo.io/ip' 'ident.me' 'ipecho.net/plain') # https://opensource.com/article/18/5/how-find-ip-address-linux
    shuffle # dnsa
    for dns in "${dnsa[@]}"; do
      local pub_ip2="$(curl -4 -s "${dns}")"
      if [[ "${pub_ip2}" =~ ^[0-9.]{8,15}$ ]]; then
        printf '%s %s\n' "${pub_ip2}" "${dns}"
        break
      fi
      pub_ip2=''
    done
    if [ -z "${pub_ip2}" ]; then
      pub_ip2="${g_pub_ip}"
      printf '%s %s\n' "${pub_ip2}" '(default)'
    fi
    topts+=(--translate "${pub_ip2}")
  elif :; then
    topts+=(--stun 'stun.ekiga.net')
  fi

  if [ "${EUID}" -eq "$(id -u "${g_uid}")" ]; then
    # topts+=(-t -o "/var/log/t38modem/t38modem-trace-${g_opt_T}-$(date +'%+4Y-%m-%d_%H-%M-%S').log")
    # Run with systemd
    if [ -s "${g_watchdog}"} ]; then
      mvwatchdog
    fi
    rm -f "${g_watchdog}"
    umask 077
    local pwfake="$(printf '%*s' "${#g_pw}" '')"
    pwfake="${pwfake// /A}"
    local seds=(
      -e '/^Open / d' -e '/^Close / d'
      #-e 's/Password: .*$/Password: /g'
      -e "s:${g_pw}:${pwfake}:g"
      #-e "/^Call/! w ${g_watchdog}"
      #-e "/${g_restarts//|/\\|}/I w ${g_watchdog}"
      -E -e "/${g_restarts}/I w ${g_watchdog}"
    )
    exec "t38modem${g_opt_Tx}" "${topts[@]}" 2>&1 | sed --unbuffered "${seds[@]}"
  elif pgrep -c -u "root,${g_uid}" "t38modem${g_opt_Tx}$" > /dev/null; then
    printf "t38modem${g_opt_Tx} is already running" 1>&2
  else
    if :; then
      if [ -s "trace-${g_opt_T}.log" ]; then
        mv "trace-${g_opt_T}.log" "trace-${g_opt_T}-$(date -r 'trace.log' +'%+4Y-%m-%d_%H-%M-%S').log"
      fi
    fi
    topts+=(-t -o "trace-${g_opt_T}.log")
    _fn_cleantty
    _fn_prep
    sudo nice -n '-10' "t38modem${g_opt_Tx}" "${topts[@]}"
    _fn_cleantty
  fi
}
_fn_${g_opt_F}
