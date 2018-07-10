# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.2.0
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
sha512sums=('42a2d4c9f183fae1251100cdf3c0aa1b8b98453b3e9dc1d2278d7f6e91e58983d80f5fc51ae3f2821adb7a8b1d7be804ee013daaef98d248bc6b905a00bb1ffd')

package() {
    install -Dm755 "$srcdir/${pkgname}_v${pkgver}_linux64" "$pkgdir/usr/bin/$pkgname"
}

