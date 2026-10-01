# Maintainer: robertfoster

pkgname=cons
pkgver=2.2.0
pkgrel=1
pkgdesc="A Perl replacement for MAKE"
arch=('any')
url="https://www.gnu.org/software/cons/"
license=('GPL-2.0-or-later')
depends=('perl' 'perl-digest-md5')
source=("https://www.gnu.org/software/cons/stable/$pkgname-$pkgver.tgz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cons "$pkgdir/usr/bin/cons"
}

sha256sums=('05f21f341ef90a7f1d954a0f4429bac7afd05b94bc9fd282e1f0048a6c43c890')
