# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=slicer-bin
pkgdesc="A tool to automate the boring process of APK recon"
pkgver=1.5
pkgrel=1
arch=('x86_64')
url="https://github.com/mzfr/slicer"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar")
sha512sums_x86_64=('5077e849339c7938db2f06ff7ffd60dc80cd073fe924a771ecc175579d980af0a24c16f5afefbe500644de60ea49cd6e8394731fc1285be55f01dc1a0d035dc2')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
