#!/usr/bin/bash
set -euo pipefail
umask 027

readonly destination=/run/oneleet-apps
# Touch this file to disable personal inventory. A refresh then clears the
# mirror without reading any home. Start oneleet-user-applications-scan.service
# manually to apply the change immediately.
readonly opt_out=/etc/oneleet-agent/disable-user-applications-scan
# Mirror regular launchers at their original paths for accounts under /home.
readonly launchers=.local/share/applications
readonly max_bytes=131072
declare -A published=()
declare -A incomplete=()
staging=$(mktemp -d -- "$destination/.staging.XXXXXXXX")
temporary=$staging/launcher
listing=$staging/list
trap 'rm -f -- "$temporary" "$listing"; rmdir -- "$staging"' EXIT

accounts=
if [[ ! -e $opt_out ]]; then
  accounts=$(getent passwd)
fi
while IFS=: read -r account password uid gid comment home shell; do
  home=${home%/}
  if [[ ! $uid =~ ^[0-9]+$ || ! $gid =~ ^[0-9]+$ ||
        $home != /home/?* || "$home/" == *'/../'* || "$home/" == *'/./'* ||
        $home == *'//'* || $shell == */nologin || $shell == */false ]]; then
    continue
  fi
  if (( uid < 1000 || uid >= 65534 )); then
    continue
  fi

  # Only the unprivileged reader traverses the real home.
  reader=(setpriv --reuid "$uid" --regid "$gid" --clear-groups
          --reset-env --no-new-privs --)
  source=$home/$launchers
  target=$destination/${home#/home/}/$launchers

  if ! timeout 5s "${reader[@]}" find "$source" -ignore_readdir_race -maxdepth 1 \
       -type f -name '*.desktop' -printf '%f\0' >"$listing" 2>/dev/null; then
    if [[ -d $target ]]; then
      incomplete["$target"]=1
      printf 'Cannot scan launchers for %s; keeping the previous copy.\n' "$account" >&2
    fi
    continue
  fi

  read_failed=false
  while IFS= read -r -d '' name; do
    if ! timeout 2s "${reader[@]}" dd "if=$source/$name" bs=64K "count=$((max_bytes + 1))" \
        iflag=count_bytes,nofollow,nonblock status=none >"$temporary" 2>/dev/null; then
      published["$target/$name"]=1
      read_failed=true
    elif [[ -s $temporary ]] && (( $(stat -c %s -- "$temporary") <= max_bytes )); then
      mkdir -p -- "$target"
      mv -fT -- "$temporary" "$target/$name"
      published["$target/$name"]=1
    fi
  done <"$listing"
  if "$read_failed"; then
    printf 'Could not read all launchers for %s; keeping their previous copies.\n' "$account" >&2
  fi
done <<< "$accounts"

# Keep the mounted tree in place and prune only entries we know are gone.
while IFS= read -r -d '' path; do
  if [[ -z ${published["$path"]+present} && -z ${incomplete["${path%/*}"]+present} ]]; then
    rm -f -- "$path"
  fi
done < <(find "$destination" -type f -name '*.desktop' -print0)
