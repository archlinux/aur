# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.3.0
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl go)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/rgburke/grv/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux64")
noextract=()
sha512sums=('af798127246081631f63f43d6e4d796345cdf04af2aa2eaab79b008b8ec914be881b469c99e98abd1cbe21e40ae41f64586d56b6fdea623db90bbb48e638e990')

package() {
    install -Dm755 "$srcdir/${pkgname}_v${pkgver}_linux64" "$pkgdir/usr/bin/$pkgname"
}

