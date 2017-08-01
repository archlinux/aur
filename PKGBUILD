pkgname=mdli
pkgver=0.2
pkgrel=1
pkgdesc="A MDL interpreter"
arch=('any')
url='http://russotto.net/git/mrussotto/confusion'
license=('GPL')
makedepends=('gcc43')
source=("http://www.russotto.net/git/mrussotto/confusion/archive/v0.2.tar.gz")
md5sums=('2ed2454e1553c9ef85545cc2b7d40891')

package() {
  cd "$srcdir/confusion/src"
  make CXX='g++-4.3'
  install -Dm755 mdli $pkgdir/usr/bin/mdli
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
