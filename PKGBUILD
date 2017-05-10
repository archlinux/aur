# Maintainer: <reebydobalina@gmail.com>
pkgname=drun
pkgver=1.0.3
pkgrel=2
pkgdesc="A GTK run dialog"
arch=('any')
url="http://drun.sourceforge.net"
license=('GPL')
depends=('ruby-gtk2' 'ruby-native-package-installer' 'ruby-cairo-gobject')
source=(http://downloads.sourceforge.net/drun/${pkgname}-${pkgver}.tar.gz)
sha256sums=('950700c8af9bb65079f794608929090dd829ec0098236a257c8049777e023c90')


package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.rb" "${pkgdir}/usr/bin/${pkgname}"
}
