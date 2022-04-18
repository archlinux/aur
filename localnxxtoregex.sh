#!/usr/bin/bash

# convert USA local call NXX list from http://localcallingguide.com/
# to HylaFax+ dialrules

set -u
set -e

g_area='517'

if [ -z "${1:-}" ]; then
  echo "Usage: $(basename "$0") npamytown-date.txt > npamytown.txt"
  echo "Create nnx.txt from local nnx listing at"
  echo "http://localcallingguide.com/"
  echo "Search, Area Code/Prefix, ..., ..., Local prefixes"
  exit 1
fi

_fn_proc() {
  if [ ! -z "${nx}" ]; then
    #if [ ! -z "${message}" ]; then
    #  echo "${message}"
    #  message=''
    #fi
    local tx
    if [ "${#x}" -gt 1 ]; then
      x="[${x}]"
      tx="${nx}${x}"
      nxt+=("")
    else
      tx="${nx}${x}"
      nxt+=($'\t') # keep tabs lined up
    fi
    #local _tx="(${nx}${x})"
    nxn+=("${tx}")
    nxl+=("${npas[2]}")
    nxa+=("${npas[0]}")
    nx=''
    x=''
  fi
}

_fn_print() {
  # output dialrules regex, no longer useful now that 10 digit dialing is required
  local dt="$(date +'%F %T')"
  printf '\n'
  printf '! local dialrules NNX list\n'
  printf '! generated %s by localnxxtoregex.sh %s from Arch Linux HylaFax+ package\n' "${dt}" "$1"
  printf '! As of October 24, 2021 no more 7 digit dialing\n'
  local k a
  for k in "${!nxn[@]}"; do
    a="${nxa[k]}"
    if [ "${a}" = "${g_area}" ]; then
      a='${Area}'
    fi
    printf '! ^${Country}%s(%s)%s\t= \\1\t\t! USA NNX/NXX local %s calls\n' "${a}" "${nxn[k]}" "${nxt[k]}" "${nxl[k]}"
  done
  # output jobcontrol-local case shell match statement
  printf '\n    # local jobcontrol-local NNX list generated %s by localnxxtoregex.sh %s from Arch Linux HylaFax+ package\n' "${dt}" "$1"
  printf '    '
  local bar=''
  for k in "${!nxn[@]}"; do
    printf '%s%s%s*' "${bar}" "${nxa[k]}" "${nxn[k]}"
    bar='|'
  done
  printf ')\n'
}

while [ "$#" -gt 0 ]; do
  readarray -t npalist < <(grep '^[0-9]' "$1" | LC_ALL=C sort)
  #declare -p npalist

  nxl=() # list of city names
  nxn=() # list of nnx 55[567]
  nxa=() # list of area codes 517
  nxt=() # list of tab or not tab
  nx=''
  x=''
  # 555 & 556 will be coalesced into 55[56]
  #NPA;NXX;Rate Centre;Region;Plan Type;Call Type;Monthly Limit;Note;Effective
  #517;555;Operator;MI;;;;;
  #517;556;Operator;MI;;;;;
  #517;560;Operator;MI;;;;;
  #517;570;Operator;MI;;;;;
  for npaline in "${npalist[@]}"; do
    IFS=';' read -r -a npas <<<"${npaline}"
    nnx="${npas[1]}"
    if [ "${nnx#${nx}}" != "${nnx}" ]; then
      x+="${nnx: 2:1}"
    else
      _fn_proc
      nx="${nnx: 0:2}"
      x="${nnx: 2:1}"
    fi
  done
  _fn_proc
  unset npalist nx x npaline npas nnx
  #set > x
  _fn_print "$1"
  shift
done
