# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=tonez
pkgver=1.2
pkgrel=1
pkgdesc="Free polyphonic synthesizer for EDM"
arch=('x86_64')
url="https://t0nit0rmx.github.io/plugins/tonez"
license=('GPL3')
depends=('csound')
source=("https://www.dropbox.com/s/pmmoavuchvrsrdd/ToneZ-1.2-Linux.tar.gz?dl=1")
sha256sums=('6b43e0d983628b1d62fdffdaebbffc1e82f8b6cc9e4abc401153b1f220a45b4d')

package() {
  mkdir -p "$pkgdir"/usr/lib/vst/
  cp -r "ToneZ-$pkgver-Linux" "$pkgdir"/usr/lib/vst/
}
