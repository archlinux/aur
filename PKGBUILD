# Maintainer: Kyle Brady <kyle at spark - gap dot com>

pkgname=rcon-cli-bin
_pkgname=rcon
pkgver=0.10.2
pkgrel=1
pkgdesc="RCON client for executing queries on game servers."
arch=('x86_64')
url="https://github.com/gorcon/rcon-cli"
license=('MIT')
provides=('rcon-cli')
conflicts=('rcon-cli')
source=("https://github.com/gorcon/rcon-cli/releases/download/v$pkgver/$_pkgname-$pkgver-amd64_linux.tar.gz")
sha256sums=('621eb03c25c3af14faf83c82adbc62c720e6a2a622f2f798fae97f8191f0c222')

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-amd64_linux/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname-$pkgver-amd64_linux/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
