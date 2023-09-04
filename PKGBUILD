# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.12.1
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('1c0b467fbc7ca6b1458a7a1e41ba13f4a6b133cab3384b7808d7c7a8e1baa2d0')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
