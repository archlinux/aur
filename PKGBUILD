# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.9.1
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('c1e93584fc77b60437ceefe67ea264af602d8224d4dfc8707f54db506b6b692dfe530831367b7727c4595c46a77106a71b41cfeb9ca7789440114600871a4704')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
