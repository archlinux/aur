# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: MadPhysicist <jfoxrabinovitz at gmail dot com>

pkgname=java-testng-doc
pkgver=6.9.4
pkgrel=2
pkgdesc='Documentation for TestNG'
arch=('any')
url='http://testng.org/doc/index.html'
license=('APACHE')
source=("https://github.com/cbeust/testng/archive/testng-${pkgver}.zip")
md5sums=('0f9f67d68e9786fd2d6c6c871ffe6241')

package() {
  install -dm755 $pkgdir/usr/share/doc/testng
  cd "$srcdir/testng-testng-$pkgver"
  ln -s doc/index.html index.html
  cp -r doc "$pkgdir/usr/share/doc/testng"
}
