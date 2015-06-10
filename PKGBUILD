# Maintainer: ianux <ianux@free.fr>

pkgname=fortune-classe-americaine-fr
pkgver=20110606
pkgrel=1
pkgdesc="Fortune cookies: La Classe americaine quotes in french"
arch=('i686' 'x86_64')
url="http://ianux.fr/abitbol"
license=('unknown')
depends=('fortune-mod')
source=(abitbol)
md5sums=('6079e17e302a87dc8c0fc827a37299c8')
sha1sums=('014123f2b792c04d71113f6accf48a1c4a91e50f')

build() {
  cd ${srcdir}
  strfile abitbol abitbol.dat
}

package() {
  install -d ${pkgdir}/usr/share/fortune/fr
  install -m644 ${srcdir}/abitbol* ${pkgdir}/usr/share/fortune/fr
}
