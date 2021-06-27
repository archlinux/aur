# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=cbonsai
pkgver=1.2.1
pkgrel=1
pkgdesc='A bonsai tree generator, written in C using ncurses'
arch=('any')
url="https://gitlab.com/jallbrit/$pkgname"
license=('GPL3')
depends=('gcc' 'ncurses')
provides=('cbonsai')
conflicts=('cbonsai')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.zip")
sha256sums=('206eb5225d63999c413201f0a7fecc552289727ce40094bd503922b7affe80ec')

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" install
}

