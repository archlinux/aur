# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=svg-docs
pkgver=1.1
pkgrel=1
pkgdesc="Set of HTML documentation for Scalable Vector Graphics (SVG) 1.1"
arch=('any')
url="http://www.w3.org/TR/SVG11/"
license=('GPL')
options=('docs')
source=('http://www.w3.org/TR/SVG11/REC-SVG11-20110816.zip')
md5sums=('961a793d90c2868c95e10937f6ec3b87')

package(){  
  install -d ${pkgdir}/usr/share/doc/svg
  cp -a ${srcdir}/REC-SVG11-20110816/* ${pkgdir}/usr/share/doc/svg/
}
