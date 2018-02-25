# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=helpdeco
pkgver=2.1.4
pkgrel=1
pkgdesc="Decompiler for WinHelp (.hlp) files"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="https://sourceforge.net/projects/helpdeco/"
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr"
}

sha512sums=('e0b7445dbf5c42e2f96061cadc816786118e26229f2af23fbfd3c4ffd26cc3a5949fd2fc376e4e8ef909976bb519bf624aedfe41e881639ab2e5130fb468a502')
