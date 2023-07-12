# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('d93ef34e8ff7ba1cd22a8694a0929d0c1967ce7faf5f984b195ebc8873c38856')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
