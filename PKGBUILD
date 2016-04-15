# Maintainer: Ivanka Heins <ivanka@tuta.io>
pkgname=rslevel
pkgver=1.0
pkgrel=1
pkgdesc="Check your or others' Runescape levels, or compare the levels of multiple players"
arch=('any')
url="https://github.com/shinnova/rslevel"
license=('GPL')
depends=('python2' 'python2-colorama')
source=("git+https://github.com/shinnova/rslevel.git")
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
