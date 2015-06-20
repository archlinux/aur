# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=csv2latex
pkgver=0.18
pkgrel=1
pkgdesc="A csv to LaTeX file converter"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/en/source/oneiric/csv2latex"
#url="http://herewe.servebeer.com/csv2latex/"
#url="http://brouits.free.fr/"
#url="https://launchpad.net/csv2latex"
license=('GPL2')
depends=('glibc')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/c/csv2latex/csv2latex_$pkgver.orig.tar.gz)
md5sums=('e8fbfbfd4b3a369a8c1cedd833ebe8a3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d m755 "$pkgdir"/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
