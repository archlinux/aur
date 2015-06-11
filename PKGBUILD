# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=thinkwatt
pkgver=0.3
pkgrel=1
pkgdesc="record power consumption, calculate the average and create a gnuplot graphic"
arch=('any')
url="https://github.com/mikar/thinkwatt"
license=('GPL')
depends=("gnuplot")
optdepends=("tp_smapi")
source=(https://github.com/mikar/thinkwatt/raw/master/thinkwatt)
sha256sums=('531c0eceebe74f632ab9e70a6c3b419c0d933a7329d3037cf9a514569451d702')

package() {
  install -d    ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/
  ln -s /usr/bin/${pkgname} ${pkgdir}/usr/bin/twat
}
