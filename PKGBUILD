# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.11.1
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('234c4f487a59b09ba779426c0996b7dfe732e768d751c438d024f20502592153')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
