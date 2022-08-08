# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=slicer-bin
pkgdesc="A tool to automate the boring process of APK recon"
pkgver=1.5
pkgrel=2
arch=('x86_64')
url="https://github.com/mzfr/slicer"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}-linux.tar")
sha512sums_x86_64=('494bf1e8e7bb7061ede7be4a5947939ecfd7d1f8cdf3b91c8f0b65ce904d8d7b3ab4df68cb9f51df74d989ddaadb7ece7aa54d996201ce0f172ad7fd73f05501')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
