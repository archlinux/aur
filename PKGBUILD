# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootstrap
pkgver=4.0.0_beta.2
pkgrel=1
pkgdesc='A HTML, CSS, and JS framework for designing responsive, mobile first projects on the web.'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver//_/-}/${pkgname}-${pkgver//_/-}-dist.zip")
sha256sums=('b43e0e97d9214b5c50e9eb3ec025f575bb5f11de59f2d132f6b32a506d09b780')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,js} ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
