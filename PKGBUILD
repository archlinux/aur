# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
provides=("pfetch")
conflicts=("pfetch-rs")
source=("https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('be2a3ac8246fbf4ad36cba65a6e8e64ec3841c33eecaf997ebfd1564117028da357b27aad546b42bda1ab9d5ee93628d668fea35dd70c6aed1e72a3e32fa40fd')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
