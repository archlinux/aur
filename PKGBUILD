# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai
pkgver=1.0.4
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/$pkgname"
license=('GPL3')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.zip")
sha256sums=('d82dd5ed914324533ff48d41d6772abe16d91777fea82a877ad42e4ac723d46f')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}
