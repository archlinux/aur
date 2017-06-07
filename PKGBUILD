# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.1.8
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom')
provides=('rememberthemilk')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk-${pkgver}-amd64.deb")
md5sums=('48345dd565150a8f44b132566d4e6de1')

prepare() {
	tar -xf data.tar.xz
}

package() {
  cp -r ${srcdir}/opt ${pkgdir}
  cp -r ${srcdir}/usr ${pkgdir}
}
