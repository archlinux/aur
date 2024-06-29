# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=pfetch-rs-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="A rewrite of the pfetch system information tool in Rust"
url="https://github.com/Gobidev/pfetch-rs"
license=("MIT")
arch=("x86_64")
depends=("gcc-libs" "glibc" "sqlite")
provides=("pfetch")
conflicts=("pfetch-rs" "pfetch" "pfetch-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gobidev/pfetch-rs/releases/download/v$pkgver/pfetch-linux-gnu-x86_64.tar.gz")
b2sums=('42eae4fa217adcb38d3deba6d40876393b727db721cefa3aa9f9d7aeb5b0aa8f9226c4a0f23f97900eb47550135728905f3532703f3e7246e38e75c628cbda95')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/pfetch"
}
