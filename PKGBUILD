# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=berusky2-data
pkgver=0.12
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban (Data files)."
arch=('any')
url="https://www.anakreon.cz/berusky2.html"
license=('GPL')
source=("https://www.anakreon.cz/download/berusky2-data-$pkgver.tar.xz")
md5sums=('db7f848ddd596625e05af63a54e166c2')

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  mkdir -p "$pkgdir/usr/share/berusky2/"
  cp -r *[^.ini] "$pkgdir/usr/share/berusky2/"
  chmod -R 644 "$pkgdir/usr/share/berusky2/"
}
