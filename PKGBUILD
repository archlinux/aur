# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ofile
pkgver=0.3
pkgrel=1
pkgdesc="Multi-threaded file download"
url="https://github.com/ZaViBiS/multithreaded-file-upload"
arch=("x86_64")
license=('MIT')
md5sums=("0da57cb4972a7f985347e175564a204c")
source=("https://github.com/ZaViBiS/multithreaded-file-upload/releases/download/$pkgver/linux_x86_64_ofile")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "${srcdir}/linux_x86_64_ofile" "${pkgdir}/usr/bin/ofile"
  chmod +x "${pkgdir}/usr/bin/ofile"
}
