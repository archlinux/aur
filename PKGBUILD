# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
depends=("gcc-libs" "glibc" "sqlite")
provides=("pfetch")
conflicts=("pfetch-rs" "pfetch" "pfetch-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('1b38c63ad605c8a7a3a782c19be9a1b2e72908175ae485102f67a1bd8a64ac7ab827c32c5a5bbd18cb533d3469fcb44e5de2bbff29a3659c917c03ea17dace85')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
