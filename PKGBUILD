# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.10.1
pkgrel=1
arch=('x86_64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('27ccd709fe7377bbf2ef578825f73d6b84a0dc86acb36fd90e5b0254558df5c6')

build() {
    return 0
}

package() {
    install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
}
