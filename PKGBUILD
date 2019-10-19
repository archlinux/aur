# Maintainer: loserMcloser <reebydobalina@gmail.com>
pkgname=drun-gtk3
pkgver=1.0.3.a
pkgrel=1
pkgdesc="A GTK3 run dialog"
arch=('any')
provides=('drun')
conflicts=('drun')
url="https://github.com/loserMcloser/drun-gtk3"
license=('GPL')
depends=('ruby-gtk3' 'ruby-native-package-installer' 'ruby-cairo-gobject')
install="drun-gtk3.install"
source=(https://github.com/loserMcloser/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d97abee8e1a9dc0abce1b01136c3341c079e5570415837988ed65c29b5d347b2')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/drun.rb" "${pkgdir}/usr/bin/drun"
}
