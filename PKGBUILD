# Maintainer: ZaViBiS <igordnepr27 at gmail dot com>

pkgname=ofile
pkgver=0.2
pkgrel=1
pkgdesc="Multi-threaded file download"
url="https://github.com/ZaViBiS/multithreaded-file-upload"
arch=("x86_64")
license=('MIT')
md5sums=("d6ab526a3d73932f3734ec0c6ab93fb3")
source=("https://github.com/ZaViBiS/multithreaded-file-upload/releases/download/$pkgver/linux_x86_64_ofile")

package() {
  # echo 'Hello to you!' > "${srcdir}/hello-world.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/linux_x86_64_ofile" "${pkgdir}/usr/bin/ofile"
  chmod +x "${pkgdir}/usr/bin/ofile"
}
