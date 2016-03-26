# Maintainer: Aoibhinn di Tori <email@aoibh.in>

pkgname="yank"
pkgver=0.6.4
pkgrel=1
pkgdesc="Copy terminal output to clipboard"
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=("MIT")
depends=("xsel")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/mptre/yank/archive/v$pkgver.tar.gz")
md5sums=('32beb356047e3f7022fd829d0e310c13')

build() {
  cd  "$pkgname-$pkgver"
  make
}

package() {
  cd  "$pkgname-$pkgver"
  PREFIX="$pkgdir"/usr make install
}
