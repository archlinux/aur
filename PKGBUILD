# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
provides=("pfetch")
conflicts=("pfetch-rs" "pfetch" "pfetch-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('d5dad2bfab8813ea8b6e4cff6cc01e1161df3cd5c978041f0a66e0932ef285ed11eae3f57224ec63f09bc925a9a8e364caed99d4dbbe9e09110687d62b17c92e')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
