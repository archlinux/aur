# Maintainer: Coobyk <mail@coobyk.com>
# CI substitutes 0.1.0.r122.g7293528 and 144f7d3c4b61529ed7535107572fab5a09ba3a3a352dcda57235d946bc83d931 for each published nightly build.
pkgname=mca-selector-rs-bin
_pkgname=mca-selector
pkgver=0.1.0.r122.g7293528
pkgrel=1
pkgdesc="A faithful Rust + GPUI port of MCA Selector (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Coobyk/mca-selector-rs"
license=('MIT')
depends=('fontconfig' 'libxcb' 'libxkbcommon' 'wayland' 'alsa-lib')
provides=("$_pkgname")
conflicts=("$_pkgname" 'mca-selector-rs-git')
source=("${_pkgname}-${pkgver}.bin::https://github.com/Coobyk/mca-selector-rs/releases/download/nightly/mca-selector-linux-x86_64")
sha256sums=('144f7d3c4b61529ed7535107572fab5a09ba3a3a352dcda57235d946bc83d931')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "$pkgdir/usr/bin/$_pkgname"
}
