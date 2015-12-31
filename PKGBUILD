# Maintainer: Aoibhinn di Tori <email@aoibh.in>

pkgname="yank"
pkgver=0.6.2
pkgrel=1
pkgdesc="Copy terminal output to clipboard"
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=("MIT")
depends=("xsel")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/mptre/yank/archive/v$pkgver.tar.gz")
md5sums=('7328ffc90904d195b65055cf8d6577a9')

build() {
  cd  "$pkgname-$pkgver"
  make
}

package() {
  cd  "$pkgname-$pkgver"
  PREFIX="$pkgdir"/usr make install
}
