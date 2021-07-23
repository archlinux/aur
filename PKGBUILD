# Maintainer: <mrcjkb89@outlook.com>
pkgname=drun3
pkgver=1.0.0
pkgrel=2
pkgdesc="A GTK3 run dialog (drun fork with GTK3 support)"
conflicts=('drun')
arch=('any')
url="https://github.com/MrcJkb/drun3"
license=('GPL')
depends=('ruby-gtk3' 'ruby-native-package-installer' 'ruby-cairo-gobject')
source=(https://github.com/MrcJkb/drun3/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('7258b2c67218063a78fab0b2d132cf66d91c10935915b38ec89e70844360dd06')


package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/drun.rb" "${pkgdir}/usr/bin/drun"
}
