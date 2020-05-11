# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/durt"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/durt-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('01ffb66823cb7f861c7ad6d061b1fb919504f88571a5e3fa19b38450f9a590e04466a6e272eb2c45cd07bb408ad5d00670e96dfe0e91c5f45d3550ee3a3ee549')

package() {
    cd durt-$arch-unknown-linux-gnu
    install -Dm755 "durt" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/durt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/durt"
}
