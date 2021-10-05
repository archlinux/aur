# Maintainer: Cauê Baasch de Souza <cauebs@pm.me>
pkgname=durt-bin
pkgver=1.0.2
pkgrel=2
pkgdesc="Command line tool for calculating the size of files and directories"
provides=('durt')
conflicts=('durt')
arch=('x86_64')
url="https://github.com/cauebs/durt"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/durt-$arch-unknown-linux-gnu.tar.gz")
sha512sums=('50af802a0b2433ac70f95fc505c72774ae3b4215980b780107c15f68d767e37643c9e2bf24da15a5e3d4dbab339433443ca0ffd45b585363115e373254ae2c0d')

package() {
    cd durt-$arch-unknown-linux-gnu
    install -Dm755 "durt" -t "$pkgdir/usr/bin"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/durt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/durt"
}
