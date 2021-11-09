# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="Command line tool for calculating the size of files and directories"
provides=('durt')
conflicts=('durt')
arch=('x86_64')
url="https://github.com/cauebs/durt"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/durt-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('fb327f8e624aeaa3af9a7fd1247cf6430837d4146c0ce928a79d4384d0ab945497c646a2ddb3e40b098d2f76ea86ece6535b046c9229f78c15cc299869344fae')

package() {
    cd durt-$arch-unknown-linux-gnu
    install -Dm755 "durt" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/durt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/durt"
}
