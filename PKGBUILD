# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.8.1
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f0f47bd4ed24738299536e5cee3599c21c99e20b3f9e9581383a20bcd5c55607')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
