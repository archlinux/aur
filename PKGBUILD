# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.2.0
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('f351fe04df67d5d1b12fae6388fdd0406ea1985af8c59314d5911872fad2724770391c144ed5dbf09061ed019b9e3222b8bb28cd1bebbe3b3d39d70936f977c3')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
