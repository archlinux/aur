# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.2.0
pkgrel=2
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
sha256sums_x86_64=('bc751bd61cfa906bd1aff3aa26e4d368bfba02d9b03514f4b06d8bf6c5d3cb3d')
sha256sums_arm64=('49ab1d09e638e0a095ae62832fe08ecd2c3f86515525ac623ca3417e6290b28a')
sha256sums_i386=('fe1d65dcc252335c52fa833a4005e0e389b3395cfa1204ee8efe4567c5f8c842')
sha256sums_armv6h=('5092bbbd0b71308aed5a05b0e502ddadf9eb1b138e0677dfd131d088b6da7f09')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
