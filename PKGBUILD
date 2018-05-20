# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootstrap
pkgver=4.1.1
pkgrel=1
pkgdesc='A HTML, CSS, and JS framework for designing responsive, mobile first projects on the web.'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver//_/-}/${pkgname}-${pkgver//_/-}-dist.zip")
sha256sums=('064bdfae255002318385d2bba81e379d3a65b24adab9d77ce39fba04675ff210')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,js} ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
