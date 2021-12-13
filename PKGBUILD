# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ofile
pkgver=0.7
pkgrel=1
pkgdesc="Multi-threaded file download"
url="https://github.com/ZaViBiS/multithreaded-file-upload"
arch=("x86_64")
license=('MIT')
md5sums=("0ae9e06c01113a05b5aaef378e1909a4")
source=("https://github.com/ZaViBiS/multithreaded-file-upload/releases/download/$pkgver/linux_x86_64_ofile")

package() {
  # mkdir -p "${pkgdir}/usr/bin"
  install -D "$srcdir/linux_x86_64_ofile" "$pkgdir/usr/bin/$pkgname"
  # chmod +x "${pkgdir}/usr/bin/ofile"
}
