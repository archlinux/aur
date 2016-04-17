# Maintainer: Ivanka Heins <ivanka@tuta.io>
pkgname=rslevel
pkgver=1.0
pkgrel=3
pkgdesc="Check your or others' Runescape levels, or compare the levels of multiple players"
arch=('any')
url="https://github.com/shinnova/rslevel"
license=('GPL')
depends=('python2' 'python2-colorama')
source=("https://raw.githubusercontent.com/shinnova/rslevel/5b4434dc6f8aceb384ea4ed01faf57fce71d88cf/rslevel")
md5sums=('067df7f766d7fbd09f0ee7adb2646ba5')

package() {
  cd $srcdir
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
