# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('2191a19af4ab21d9746da652d9cdbf053d88ee9741682c7acbc66544a99d47d9')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
