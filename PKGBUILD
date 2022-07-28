# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
# _url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
source_x86_64=("${_url}_x86_64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_i386.tar.gz")
sha256sums_x86_64=('ba0fb8c9e390419e2e3d5f1bcca8117ee5dac3e0ad063c29cec7cb0d53b6c6e5')
sha256sums_arm64=('55813a2efcdf395f4f96df31cddb2955402f064df77cdbf6262487e82fb5c934')
sha256sums_i386=('9246b202538dbd320870c08d72f44e632e9b73150e568b37d989cc54baf82357')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
