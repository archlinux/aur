# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
depends=("gcc-libs" "glibc" "sqlite")
provides=("pfetch")
conflicts=("pfetch-rs" "pfetch" "pfetch-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('8dbe63fd0b9e446eaa0ede2e9e141d581e4b7b759669398e80d5982a7f4cc067cfae9cefd44f017c4e9a26b4d09fe26cfadb43ae2b5845ac1294eadf5dfd3da9')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
