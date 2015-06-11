pkgname=awmtt
pkgver=0.4
pkgrel=2
pkgdesc="Test and preview your AwesomeWM configuration with Xephyr"
arch=("any")
url="https://github.com/mikar/awmtt"
license=("MIT")
depends=("xorg-server-xephyr")
source=(https://raw.github.com/mikar/awmtt/master/awmtt.sh)
sha256sums=('146f68ac831ce6bc2f417472c7b46c121efce31a63b911c2324368bb83da103e')

package() {
  install -d ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
