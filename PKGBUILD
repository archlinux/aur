# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai
pkgver=1.2.0
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/$pkgname"
license=('GPL3')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.zip")
sha256sums=('6acbf14df2fc26a2b849a59dad64510aec436764d1257fa17df1de0a1e327456')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}

