# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.10.0
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('078f953c61c408b777124b6014bee1a0a3e13f0b9b30f201ed4098ef9e991e8a')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
