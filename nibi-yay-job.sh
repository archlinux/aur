#!/bin/bash
#SBATCH --account=def-smoolak
#SBATCH --time=23:59:00
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --tmp=220G
set -x
PKGNAME="$1"
BASE=/project/def-smoolak/aur-build
module load apptainer
# Build on node-local scratch: /project has a 500K-inode quota that two full
# container sandboxes blow past. $SLURM_TMPDIR is node-local (no shared quota).
WORK="${SLURM_TMPDIR:-$BASE}"
df -h "$WORK"
SB="$WORK/sb-$PKGNAME"
rm -rf "$SB"
cp -a "$BASE/arch-sandbox" "$SB"
# Create bind mountpoints the cluster's apptainer requires. Paths differ per
# cluster (nibi: /project; narval: /lustre06/project; etc.), so parse the
# configured bind paths and add a broad Alliance-lustre fallback set.
mkdir -p "$SB"/{project,scratch,localscratch,build,home,tmp} 2>/dev/null
for bp in $(grep -rhoP '^\s*bind path\s*=\s*\K[^,:#]+' /etc/apptainer/ 2>/dev/null | tr -d ' '); do
  mkdir -p "$SB$bp" 2>/dev/null
done
for n in 01 02 03 04 05 06 07 08 09 10; do
  mkdir -p "$SB/lustre$n"/{project,scratch,home} 2>/dev/null
done
apptainer exec --fakeroot --writable --bind "$BASE:/build" "$SB" \
  /build/nibi-build-aur.sh "$PKGNAME"
rc=$?
echo "=== YAY JOB EXIT $rc for $PKGNAME ==="
exit $rc
