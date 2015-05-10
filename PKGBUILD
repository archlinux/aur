# Maintainer: K1412 <FD.K1412@openaliasbox.org>
pkgname=prototype
pkgver=1.7.1.0
pkgrel=1
pkgdesc="Prototype is a JavaScript Framework that aims to ease development of dynamic web applications." 
arch=('any')
url="http://prototypejs.org/"
license=('MIT')

source=('http://ajax.googleapis.com/ajax/libs/prototype/1.7.1.0/prototype.js')
md5sums=('34171a46fc699bfb7d5d887b53bd530d')

package() {
  mkdir -p ${pkgdir}/usr/share/javascript/prototype/
  cp ./prototype.js ${pkgdir}/usr/share/javascript/prototype/ 
}
