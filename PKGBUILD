# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
pkgname=dromajo
pkgver=1.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/chipsalliance/dromajo/"
license=('MIT')
source=("https://github.com/chipsalliance/dromajo/archive/v$pkgver.tar.gz")
md5sums=('fce6d2dfea4613c918572c9eff27c44b')

build() {
  cd "$srcdir/$pkgname-$pkgver"/src/
  make
}

package() {
  install -D -m 755 $srcdir/$pkgname-$pkgver/src/dromajo $pkgdir/usr/bin/dromajo
  install -D -m 755 $srcdir/$pkgname-$pkgver/MIT-LICENSE.txt $pkgdir/usr/share/licenses/dromajo/LICENSE
}
