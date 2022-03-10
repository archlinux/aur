# Maintainer: Konstantin Stepanov <dubj@cock.li>
pkgname=enano
pkgver=1.0
pkgrel=3
pkgdesc="A bash script to autosign documents"
arch=('any')
license=('GPL')
depends=('nano' 'python3' 'gnupg' 'xfce4-terminal')
source=('enano')
md5sums=('8340ab644bfd4d49e47e27bab12721fe')

package() {
 mkdir -p $pkgdir/usr/bin
 mv $srcdir/enano $pkgdir/usr/bin
}
