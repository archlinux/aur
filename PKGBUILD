# Maintainer: Ivanka Heins <ivanka@tuta.io>
pkgname=rslevel
pkgver=2.0
pkgrel=8
pkgdesc="Check your or others' Runescape levels, or compare the levels of multiple players"
arch=('any')
url="https://gitlab.com/shinnova/rslevel"
license=('GPL')
depends=('python' 'python-colorama' 'python-urllib3')
source=("https://gitlab.com/shinnova/rslevel/raw/master/rslevel")
md5sums=('SKIP')

package() {
  cd $srcdir
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
}
