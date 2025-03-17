#!/usr/bin/ash
# shellcheck shell=bash
# vim: set ft=sh ts=2 sw=2 et:

#  ┬─┐┬ ┐┌┐┐┌─┐┌┐┐o┌─┐┌┐┐┐─┐
#  ├─ │ │││││   │ ││ ││││└─┐
#  ┘  ┘─┘┘└┘└─┘ ┘ ┘┘─┘┘└┘──┘

# Logging helpers. Send the argument list to plymouth(1), or fold it
# and print it to the standard error.
dm_nuke_message() {
  local IFS=' '
  if command -v plymouth 1>/dev/null 2>&1 && plymouth --ping 2>/dev/null; then
    plymouth message --text="cryptsetup: $*"
  else
    msg "cryptsetup: $*"
  fi
  return 0
}

#  ┌┌┐┬─┐o┌┐┐
#  ││││─┤││││
#  ┘ ┘┘ ┘┘┘└┘

run_hook() {
  local quiet rootdelay
  # Switches
  local kf_enabled='false' ks_enabled='false' nuke_enabled='false'
  # Keyfile configuration
  local kf_root_dev kf_root_fs kf_path kf_offset=0 kf_size
  # Keyscript configuration
  local ks_root_dev ks_root_fs ks_path
  # Nuke configuration
  local nuke_hash
  # Cryptsetup configuration
  local device alias='cryptroot' cryptargs
  rootdelay="$(getarg rootdelay)"

  mkdir -p /tmp/dm-nuke
  cd /tmp/dm-nuke

  # Reading configuration
  local oldifs key value configuration
  oldifs="$IFS"
  IFS=,
  configuration="$(getarg dm-nuke)"
  if [ -z "$configuration" ]; then
    dm_nuke_message "dm-nuke is loaded but not configured"
    sleep 2
    exit 0
  fi
  quiet="$(getarg quiet)"
  if [ "$quiet" = "y" ]; then
    quiet=">/dev/null"
  fi
  for option in $configuration; do
    key="${option%%=*}"
    value="${option#*=}"
    case "$key" in
    device)
      if resolved="$(resolve_device "$value" "$rootdelay")"; then
        device="$resolved"
      else
        err "failed to resolve root device $value"
      fi
      ;;
    alias)
      alias="$value"
      ;;
    cryptargs)
      cryptargs="$value"
      ;;
    keyfile-root)
      if ! echo "$value" | awk -F: '{exit($NF==2)}'; then
        dm_nuke_message "warning: keyfile-root must be in format path:fstype"
      elif resolved="$(resolve_device "$(echo "$value" | cut -d: -f1)" "$rootdelay")"; then
        kf_root_dev="$resolved"
        kf_root_fs="$(echo "$value" | cut -d: -f2)"
      else
        dm_nuke_message "warning: failed to resolve device for the keyfile $(echo "$value" | cut -d: -f1)"
      fi
      ;;
    keyfile-path)
      kf_enabled='true'
      kf_path="$value"
      ;;
    keyfile-offset)
      kf_offset="$value"
      ;;
    keyfile-size)
      kf_size="$value"
      ;;
    keyscript-root)
      if ! echo "$value" | awk -F: '{exit($NF==2)}'; then
        dm_nuke_message "warning: keyscript-root must be in format path:fstype"
      elif resolved="$(resolve_device "$(echo "$value" | cut -d: -f1)" "$rootdelay")"; then
        ks_root_dev="$resolved"
        ks_root_fs="$(echo "$value" | cut -d: -f2)"
      else
        dm_nuke_message "warning: failed to resolve device for the keyscript $(echo "$value" | cut -d: -f1)"
      fi
      ;;
    keyscript-path)
      ks_enabled='true'
      ks_path="$value"
      ;;
    nuke)
      nuke_enabled='true'
      nuke_hash="$value"
      ;;
    *)
      dm_nuke_message "error: unknown option $key: $value" 1>&2
      exit 1
      ;;
    esac
  done
  IFS="$oldifs"
  unset oldifs

  # Load dm-crypt module
  modprobe -a -q dm-crypt >/dev/null 2>&1

  # If keyfile options are configured...
  if [ "$kf_enabled" = 'true' ]; then
    # ...then mount keyfile root filesystem if defined...
    if [ -n "$kf_root_dev" ]; then
      mkdir kf_mp
      if [ "$kf_root_fs" = "auto" ]; then
        mount -r "$resolved" kf_mp
      else
        mount -r -t "$kf_root_fs" "$resolved" kf_mp
      fi
      kf_path="kf_mp/${kf_path#/}"
    fi
    # ... and read the key to the temp file
    if [ -n "$kf_size" ]; then
      dd if="$kf_path" of=kf iflag=skip_bytes skip="$kf_offset" bs="$kf_size" count=1 2>/dev/null
    else
      dd if="$kf_path" of=kf iflag=skip_bytes skip="$kf_offset" 2>/dev/null
    fi
    # Do not forget to unmount at the end
    [ -n "$kf_root_dev" ] && umount kf_mp
  fi

  # If keyscript options are configured...
  if [ "$ks_enabled" = 'true' ]; then
    # ...then mount keyscript root filesystem if defined...
    if [ -n "$ks_root_dev" ]; then
      mkdir ks_mp
      if [ "$ks_root_fs" = "auto" ]; then
        mount -r "$resolved" ks_mp
      else
        mount -r -t "$ks_root_fs" "$resolved" ks_mp
      fi
      ks_path="$(pwd)/ks_mp/${ks_path#/}"
    fi
    # ... and execute the script
    if ! (cd "$(dirname "$ks_path")" && eval "$ks_path") >ks; then
      dm_nuke_message "warning: $ks_path exited with nonzero code"
    fi
    # Do not forget to unmount at the end
    [ -n "$ks_root_dev" ] && umount ks_mp
  fi

  # To protect ourselves from early hooks
  if [ -b "/dev/mapper/$alias" ]; then
    if [ ! -f /tmp/dm-nuke.success ]; then
      dm_nuke_message "warning: /dev/mapper/$alias already exists, skipping decryption"
    fi
    return 0
  fi

  if ! cryptsetup isLuks "$device" 1>/dev/null; then
    err "$device is not a LUKS device"
    return 1
  fi

  # Try to decrypt using a keyfile
  local interactive='true' password
  if [ -f kf ]; then
    if ! eval cryptsetup luksOpen --key-file=kf "$device" "$alias" "$cryptargs" "$quiet"; then
      dm_nuke_message "warning: invalid keyfile key"
    else
      interactive=false
    fi
  fi
  if [ -f ks ]; then
    if ! eval cryptsetup luksOpen --key-file=ks "$device" "$alias" "$cryptargs" "$quiet"; then
      dm_nuke_message "warning: invalid keyscript key"
    else
      interactive=false
    fi
  fi

  # Ask for the password
  if [ "$interactive" = 'true' ]; then
    if [ "$nuke_enabled" = 'true' ]; then
      echo "$nuke_hash kf" > checksum
      cat <<EOF >nuke-or-mount.sh
#!/usr/bin/ash
set -euo pipefail
cat >kf
if [ "$nuke_enabled" = 'true' ]; then
  for algo in md5sum sha1sum sha256sum sha512sum; do
    if eval "\$algo" -c checksum "<kf" 1>/dev/null 2>&1; then
      echo YES | cryptsetup erase "$device"
      cat <<EOT 1>&2

...............................________________................................
..........................____/.(..(....)...)..\___............................
........................./(.(..(..)..._....))..)...)\..........................
.......................((.....(...)(....)..)...(...)..)........................
.....................((/..(._(...)...(..._).).(..().)..).......................
....................(.(..(.(_)...((....(...)...((_.)....)_.....................
...................(.(..)....(......(..)....)...)...).(...)....................
..................(..(...(..(...).(.._..(._).)...)...).).(.)...................
..................(.(..(...).(..)...(..)).....)._)(...)..)..)..................
.................(.(..(.\.).(....(_..(.).(.)..)...).)..)).(.)..................
..................(..(...(..(...(_.(.).(._....)..).(..)..)...).................
.................(.(..(.(..(..).....(_..)..).).._)...)._(.(.)..................
..................((..(...)(....(....._....)..._)._(_.(..(_.)..................
...................(_((__(_(__((.(.(.|..).).).)_))__))_)___)...................
...................((__)........\\\\||lll|l||///..........\_))...................
............................(.../(/.(..)..).)\...).............................
..........................(....(.(.(.|.|.).).)\...)............................
...........................(.../(|./.(.)).).).)).).............................
.........................(.....(.((((_(|)_))))).....)..........................
..........................(......||\(|(|)|/||.....)............................
........................(........|(||(||)||||........).........................
..........................(.....//|/l|||)|\\\\.\.....)...........................
........................(/././/../|//||||\\\\..\.\..\._).........................
-----------------------------!!!.YOU.ARE.NUKED.!!!-----------------------------
          Data is destroyed! They may try to extract information from
              you, but there's nothing more you can do. Good luck!
EOT
      exit 1
    fi
  done
  cryptsetup luksOpen --key-file=kf $device $alias $cryptargs $quiet && exit 0 || exit 1
fi
EOF
      chmod 0755 nuke-or-mount.sh
    fi
    if command -v plymouth 1>/dev/null 2>&1 && plymouth --ping 2>/dev/null; then
      plymouth ask-for-password \
        --prompt="Enter passphrase for $alias ($device)" \
        --command="$(pwd)/nuke-or-mount.sh"
    else
      echo ""
      # Ask for a correct password infinitely
      while printf "Enter passphrase for %s (%s): " "$alias" "$device"; do
        read -s -r password
        printf "%s" "$password" > kf
        if ./nuke-or-mount.sh; then
          break
        fi
        dm_nuke_message "error: failed to decrypt $alias with the password provided"
        sleep 2
      done
    fi
  fi

  # Check mountpoint
  if [ ! -e "/dev/mapper/$alias" ]; then
    err "decryption has succeeded, but /dev/mapper/$alias creation has failed"
    return 1
  fi

  cd /
  rm -rf /tmp/dm-nuke
  touch /tmp/dm-nuke.success
  return 0
}
