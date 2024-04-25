# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386' 'armv6h')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_linux"
source_x86_64=("${_url}_amd64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_386.tar.gz")
source_armv6h=("${_url}_armv6.tar.gz")
sha256sums_x86_64=('82811d323c3017cbc570206b64accaffbd45cb2f5bf456965c5a7f6693ed456f')
sha256sums_arm64=('af60f475acd0b69e45cc89a4ece7ef2501011717e6aa2d71708de68cc2068b8b')
sha256sums_i386=('bf6a626bad34cd6ec729a940a4d89a94f9da7f5fb227cc900fa3f3b7e7b29ef2')
sha256sums_armv6h=('ae48cf37fe2b548c07737e99ce1fbdfbbb769c2f4be754a78869a5041d79aebc')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
