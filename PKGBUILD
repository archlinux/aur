# Maintainer:
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=xfce4-artwork
pkgver=0.1
pkgrel=6
pkgdesc="Backdrops for the Xfce4 desktop"
arch=('any')
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
source=(http://download2.berlios.de/xfce-goodies/${pkgname}-${pkgver}.tar.gz)
md5sums=('b7612ee950fcf052e5acfacd0fda729f')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}/backdrops/
  install -d "${pkgdir}"/usr/share/xfce4/backdrops
  install -t "${pkgdir}"/usr/share/xfce4/backdrops *.{png,jpg}
}
