# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
depends=("gcc-libs" "glibc" "sqlite")
provides=("pfetch")
conflicts=("pfetch-rs" "pfetch" "pfetch-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('6d095519bcdcc361b794058f943ee984328027dd9f1b1fc97c77cf6188b41403892e307579257480742a5a614727faeb7daebaea349a523086beb4b5be2f5875')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
