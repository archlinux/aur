# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.3.2
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/rgburke/grv/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux64")
noextract=()
sha512sums=('fafa6302c5b9258823abc019eedcbcf60995c47e309f9722e4f1c9f52c24f8ae1c266efda408389d278eefbcce19b99491a84cf356035fc44a2c58254c9dee99')

package() {
    install -Dm755 "$srcdir/${pkgname}_v${pkgver}_linux64" "$pkgdir/usr/bin/$pkgname"
}

