#!/bin/bash
#SBATCH --account=def-smoolak
#SBATCH --partition=cpubase_bycore_b3
#SBATCH --time=23:59:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
set -x
PKG="$1"
BASE=/project/def-smoolak/aur-build
module load apptainer
SB="$BASE/sb-$PKG"
# fresh per-job sandbox copy (isolated; avoids concurrent --writable conflicts)
rm -rf "$SB"
cp -a "$BASE/arch-sandbox" "$SB"
mkdir -p "$SB"/{project,scratch,build,localscratch}
apptainer exec --fakeroot --writable --bind "$BASE:/build" "$SB" \
  /build/nibi-provision-build.sh "$PKG"
rc=$?
echo "=== JOB EXIT $rc for $PKG ==="
exit $rc
