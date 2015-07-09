# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=svg-tiny-docs
pkgver=1.2
pkgrel=1
pkgdesc="Set of HTML documentation for Scalable Vector Graphics (SVG) Tiny 1.2"
arch=('any')
url="http://www.w3.org/TR/SVGTiny12/"
license=('GPL')
options=('docs')
source=('http://www.w3.org/TR/SVGTiny12/REC-SVGTiny12-20081222.zip')
md5sums=('4904f7e3e644de830009ae2deb04d158')

package(){  
  install -d ${pkgdir}/usr/share/doc/svg-tiny
  cp -a ${srcdir}/REC-SVGTiny12-20081222/* \
   ${pkgdir}/usr/share/doc/svg-tiny/
}
