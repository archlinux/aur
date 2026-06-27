#!/usr/bin/env bash
BASE=https://cdn-zcode.z.ai/zcode/electron/releases
ARCH=x64

# HEAD-only request: avoids downloading the AppImage just to check existence.
ex(){ curl -sfI "$BASE/$1/ZCode-$1-linux-$ARCH.AppImage" >/dev/null; }

# Returns the largest integer N >= $2 for which ex(printf($1, N)) succeeds.
# Phase 1 — exponential probe: doubles the step until an upper bound hi is found.
# Phase 2 — binary search: narrows [n, hi] down to the exact boundary.
# Total cost: ~2*log2(N) requests instead of N sequential probes.
gallop(){
  local fmt=$1 n=$2 step=1 hi
  ex "$(printf "$fmt" "$n")" || { echo $((n-1)); return; }
  while ex "$(printf "$fmt" $((n+step)))"; do n=$((n+step)); step=$((step*2)); done
  hi=$((n+step))
  while (( hi-n>1 )); do local m=$(((n+hi)/2)); ex "$(printf "$fmt" "$m")" && n=$m || hi=$m; done
  echo "$n"
}

# Hard floor: avoids re-scanning from 1.0.0 on every run.
MA=3 MI=1
# Major and minor versions are small integers, so linear probing is cheap enough.
while ex "$((MA+1)).0.0"; do MA=$((MA+1)); MI=0; done
while ex "$MA.$((MI+1)).0";  do MI=$((MI+1)); done
# Patch numbers can grow large (frequent hotfixes), so use gallop to cap request count.
PA=$(gallop "$MA.$MI.%s" 0)
echo "$MA.$MI.$PA"
