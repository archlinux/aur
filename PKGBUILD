# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.2.1
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('978eb2bff6d002e1d6a72170ab1cd012c3f0624f7e1bd5a1497369ccf4c8e67c51a26bc975153b6a14a95900e96f332effc9af6e7a233caf7166066352f8b1f8')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
