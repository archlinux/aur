# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line tool for calculating the size of files and directories"
arch=('x86_64')
url="https://github.com/cauebs/durt"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/durt-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('9bcfda324985b72298079b56d799ef64505dfbe6da4f4704515d621fb88162b89e2e8bf58904ea1ae425ce70105f3a8e62c23a0486cd9fbddaf1ec279b28eaba')

package() {
    cd durt-$arch-unknown-linux-gnu
    install -Dm755 "durt" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/durt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/durt"
}
