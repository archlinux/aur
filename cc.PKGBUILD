# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
#
# Cross-compilation of the release tag, packaged for pacman — CARCH-driven.
# = PKGBUILD (native pacman package) but build() maps makepkg's $CARCH to the
#   matching GOARCH + static-musl cross toolchain, so ONE makepkg run per arch
#   produces that arch's package. Build a foreign arch with:
#
#     makepkg --config <(cat /etc/makepkg.conf; echo CARCH=aarch64) -p cc.PKGBUILD
#
#   Loop CARCH externally for every release arch (this is exactly how the
#   apt-repo's updskywirepacman.sh publishes the signed pacman repo). Native
#   builds too — CARCH=x86_64 just uses musl-gcc like the base PKGBUILD.
source PKGBUILD
pkgdesc="Software defined networking with public keys. Skycoin.com. Cross-compile (per-CARCH)."

# Static-musl cross toolchains (native musl-gcc comes from the inherited 'musl').
makedepends=("${makedepends[@]}" \
  "aarch64-linux-musl-cross-bin" \
  "muslcc-arm-linux-musleabihf-cross-bin" \
  "muslcc-arm-linux-musleabi-cross-bin")

build() {
mkdir -p "${srcdir}/go/bin" || true
export GOPATH="${srcdir}/go"
export GOBIN="${GOPATH}/bin"
export GOOS=linux
export CGO_ENABLED=1
# Map makepkg's CARCH -> GOARCH + static-musl CC. Mirrors the per-arch toolchain
# choices in cc.deb.PKGBUILD; native x86_64/i686 use the plain musl-gcc.
unset GOARM
case "$CARCH" in
  x86_64)              export GOARCH=amd64  CC=musl-gcc ;;
  i686)                export GOARCH=386    CC=musl-gcc ;;
  aarch64|armv8)       export GOARCH=arm64  CC=aarch64-linux-musl-gcc ;;
  armv7h|armv7l|armv7|armhf)
                       export GOARCH=arm GOARM=7 CC=arm-linux-musleabihf-gcc
                       source /etc/profile.d/arm-linux-musleabihf-cross.sh 2>/dev/null || true ;;
  armv6h)              export GOARCH=arm GOARM=6 CC=arm-linux-musleabihf-gcc
                       source /etc/profile.d/arm-linux-musleabihf-cross.sh 2>/dev/null || true ;;
  armel|arm)           export GOARCH=arm GOARM=5 CC=arm-linux-musleabi-gcc
                       source /etc/profile.d/arm-linux-musleabi-cross.sh 2>/dev/null || true ;;
  riscv64)             export GOARCH=riscv64 CC=riscv64-linux-musl-gcc ;;
  *)                   _msg2 "CARCH=$CARCH not mapped; using native musl-gcc"; export CC=musl-gcc ;;
esac
_msg2 "cross-compiling for CARCH=$CARCH -> GOARCH=${GOARCH} CC=${CC}${GOARM:+ GOARM=$GOARM}"
_build
}
