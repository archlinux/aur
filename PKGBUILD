# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('bc746c9ed405713675a32b1ffef548ac4f5d76e158656f948224a684bd0faee3')

build() {
    return 0
}

package() {
    install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
