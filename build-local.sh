#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
source_tree=${TERAKAN_SOURCE_TREE:-"$script_dir/../mesa-terakan-ai-upstreamed"}
source_tree=$(realpath -e -- "$source_tree")

if [[ ! -f "$source_tree/meson.build" ||
      ! -f "$source_tree/src/amd/terascale/vulkan/terakan_instance.c" ]]; then
  echo "build-local.sh: not a Terakan Mesa source tree: $source_tree" >&2
  exit 2
fi

work_root="$script_dir/.makepkg"
snapshot="$work_root/local-source"
srcdest="$work_root/srcdest-local"
builddir="$work_root/build"
pkgdest="$script_dir/packages"

# These paths are private generated state below the packaging repository.
rm -rf -- "$snapshot" "$srcdest"
mkdir -p -- "$work_root" "$srcdest" "$builddir" "$pkgdest"

mkdir -p -- "$snapshot"
git -C "$snapshot" init --quiet
rsync -a --delete \
  --exclude=/.git/ \
  --exclude=/build/ \
  --exclude='/build-*/' \
  --exclude=/build-vulkan/ \
  "$source_tree/" "$snapshot/"

git -C "$snapshot" add -A
snapshot_epoch=$(git -C "$source_tree" log -1 --format=%ct)
GIT_AUTHOR_DATE="@$snapshot_epoch" \
GIT_COMMITTER_DATE="@$snapshot_epoch" \
  git -C "$snapshot" \
  -c user.name='Terakan local package' \
  -c user.email='local-package@invalid' \
  commit --quiet --allow-empty -m 'Local package snapshot'

export TERAKAN_MESA_SOURCE="file://$snapshot"
export BUILDDIR="$builddir"
export SRCDEST="$srcdest"
export PKGDEST="$pkgdest"

cd "$script_dir"
exec makepkg --cleanbuild --force "$@"
