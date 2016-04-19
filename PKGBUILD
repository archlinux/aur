# Maintainer: Ivanka Heins <ivanka@tuta.io>
pkgname=rslevel
pkgver=1.0
pkgrel=4
pkgdesc="Check your or others' Runescape levels, or compare the levels of multiple players"
arch=('any')
url="https://github.com/shinnova/rslevel"
license=('GPL')
depends=('python2' 'python2-colorama')
source=("https://raw.githubusercontent.com/shinnova/rslevel/0cb9f7cec538d9381ddca7600f7f70a8aad41114/rslevel")
md5sums=('86715bee4f4fa091674b023fbdd2161d')

package() {
  cd $srcdir
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
