# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=css-docs
pkgver=2.1
pkgrel=1
pkgdesc="Set of HTML documentation for CSS2.1"
arch=('any')
url="http://www.w3.org/TR/CSS2/"
license=('GPL')
options=('docs')
source=('http://www.w3.org/TR/CSS2/css2.tgz')
md5sums=('1302f4bf35285879aeebf4ee9b282cb2')

package(){
  rm ${srcdir}/css2.tgz
  install -d ${pkgdir}/usr/share/doc/css/css2
  cp -a ${srcdir}/* ${pkgdir}/usr/share/doc/css/css2/ 
}

