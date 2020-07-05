# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/durt"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/durt-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('6929f0d3481bb84441d2af8d8ce31dec6bedc8fa9f2230f8ebb3c982eaf64801e7b5e570c3a2fe86d5dbf464d105f0d3fa3e95527eff1ebde4a618f54b13d499')

package() {
    cd durt-$arch-unknown-linux-gnu
    install -Dm755 "durt" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/durt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/durt"
}
