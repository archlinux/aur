#!/bin/bash
# Runs INSIDE the Arch container as (fake)root. The cluster's apptainer has no
# /etc/subuid mapping, so only uid 0 exists in the namespace -> no non-root
# 'builder' user is possible, and makepkg/yay refuse root. We patch makepkg to
# permit root (the container is disposable) and resolve AUR deps recursively
# ourselves, then build+install the target straight from the AUR.
set -xeuo pipefail
PKGNAME="$1"

# The host (AlmaLinux) leaks SSL cert env vars pointing at /etc/pki/... which
# don't exist in the Arch container, breaking curl/git HTTPS. Drop them so the
# container's own CA bundle (/etc/ssl/certs) is used.
unset SSL_CERT_FILE SSL_CERT_DIR CURL_CA_BUNDLE REQUESTS_CA_BUNDLE \
      GIT_SSL_CAINFO NODE_EXTRA_CA_CERTS PIP_CERT 2>/dev/null || true

# pacman's DownloadUser drops privileges and chowns its temp dir to 'alpm',
# which fails in the single-uid (root-mapped) namespace. Disable it.
sed -i 's/^\s*DownloadUser/#DownloadUser/; s/^\s*ParallelDownloads/#ParallelDownloads/' /etc/pacman.conf

pacman -Syu --noconfirm --needed \
  base-devel git cmake ninja meson pacman-contrib ca-certificates \
  python-build python-installer python-wheel python-setuptools \
  pybind11 cuda cudnn gcc15
update-ca-trust 2>/dev/null || true
# Install the CUDA torch FIRST so deps requesting plain 'python-pytorch' are
# satisfied by its provides (python-pytorch-cuda Conflicts/Provides python-pytorch);
# otherwise a dep pulls CPU python-pytorch and conflicts with the -cuda one.
pacman -S --noconfirm --needed python-pytorch-cuda

# Make source downloads resilient to transient GitHub HTTP/2 stream resets
# (the 300MB+ TensorRT-LLM tarball intermittently fails the default 3 retries).
mkdir -p /build/srccache
cat >> /etc/makepkg.conf <<'MKEOF'
SRCDEST=/build/srccache
DLAGENTS=('file::/usr/bin/curl -qgC - -o %o %u'
          'http::/usr/bin/curl -qgb "" -fLC - --retry 15 --retry-delay 5 --retry-all-errors --connect-timeout 30 --speed-limit 10240 --speed-time 30 -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 15 --retry-delay 5 --retry-all-errors --connect-timeout 30 --speed-limit 10240 --speed-time 30 -o %o %u'
          'rsync::/usr/bin/rsync --no-motd -z %u %o'
          'scp::/usr/bin/scp -C %u %o')
MKEOF

# permit makepkg as root: neutralize the root-refusal exit (msg is "Running %s
# as root..." followed by `exit $E_ROOT`). Disposable container, so this is safe.
awk '/Running %s as root is not allowed/{f=1} f&&/exit \$E_ROOT/{sub(/exit \$E_ROOT/,"true");f=0} {print}' \
  /usr/bin/makepkg > /tmp/mp.patched && cat /tmp/mp.patched > /usr/bin/makepkg
if grep -A2 'Running %s as root' /usr/bin/makepkg | grep -q 'E_ROOT'; then
  echo "FATAL: makepkg root-patch failed"; exit 3
fi
# apptainer --fakeroot already provides namespace root (real chown works), so
# makepkg's own fakeroot for package() would nest and fail ("nested operation
# not yet supported"). Re-exec the package() stage without fakeroot.
sed -i 's/fakeroot -- bash/bash/' /usr/bin/makepkg
grep -q 'fakeroot -- bash' /usr/bin/makepkg && { echo "FATAL: fakeroot-patch failed"; exit 4; } || true

export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15 CUDA_HOME=/opt/cuda
export PATH="/opt/cuda/bin:$PATH" MAKEFLAGS="-j$(nproc)"

declare -A DONE
build_aur() {
  local pkg="$1"
  [[ -n "${DONE[$pkg]:-}" ]] && return 0
  pacman -Qq "$pkg" &>/dev/null && { DONE[$pkg]=1; return 0; }
  DONE[$pkg]=1
  # Prefer a locally-supplied PKGBUILD (to validate fixes before pushing); else
  # resolve the AUR pkgbase (sub-packages like python-tensorrt/python-cutlass
  # live under their pkgbase repo, e.g. tensorrt/cutlass) and clone it.
  local base d
  mkdir -p /aurbuild
  if [[ -f "/build/$pkg/PKGBUILD" ]]; then
    base="$pkg"; d="/aurbuild/$pkg"; rm -rf "$d"; cp -r "/build/$pkg" "$d"
  else
    base=$(curl -s "https://aur.archlinux.org/rpc/v5/info?arg[]=$pkg" \
      | python -c "import json,sys; r=json.load(sys.stdin).get('results',[]); print(r[0]['PackageBase'] if r else '$pkg')" 2>/dev/null)
    [[ -z "$base" ]] && base="$pkg"
    d="/aurbuild/$base"
    [[ -d "$d/.git" ]] || { rm -rf "$d"; git clone --depth=1 "https://aur.archlinux.org/$base.git" "$d"; }
  fi
  DONE[$base]=1
  ( cd "$d"
    # build any AUR (non-repo) deps first
    for dep in $(makepkg --printsrcinfo | grep -oP '^\s*(make|check)?depends = \K[^<>=:]+' | sort -u); do
      pacman -Sp "$dep" &>/dev/null || build_aur "$dep"
    done
  )
  ( cd "$d"
    # Extract + install deps + run prepare(), but don't build yet.
    makepkg -so --noconfirm --needed --nocheck 2>&1 | tail -3
    # Relax build-backend version caps: several AUR deps pin e.g. flit_core<4 or
    # setuptools-scm<10 while Arch ships newer ones, breaking --no-isolation
    # builds. Strip the version spec from build-system backends only.
    # Remove only UPPER-bound caps (e.g. <4) from build-backend requirement
    # strings, keeping lower bounds (scikit-build-core's minimum-version feature
    # needs the >= to stay) and never touching module-path backends like
    # "flit_core.buildapi".
    # NB: perl substitution uses | delimiters (not {}) to avoid colliding with
    # find's {} placeholder.
    find src -maxdepth 4 -name pyproject.toml -exec perl -0777 -pi -e \
      's/"((?:flit[_-]core|setuptools[_-]scm|hatchling|hatch-vcs|poetry[_-]core|pdm-backend|scikit-build-core|maturin|meson-python)[^"]*?)"/my $s=$1; $s=~s|,?\s*<\s*[0-9][0-9a-zA-Z.*]*\s*,?||g; "\"$s\""/ge' {} + 2>/dev/null || true
    # Build + install from the already-extracted, relaxed sources.
    makepkg -ei --noconfirm --nodeps --nocheck
  )
}

build_aur "$PKGNAME"
echo "=== INSTALL CHECK ==="
pacman -Q "$PKGNAME" && echo "INSTALLED-OK: $PKGNAME"
