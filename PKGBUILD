# Maintainer: egoroff <egoroff@gmail.com>
pkgname=editorconfiger-bin
pkgver=0.4.1
pkgrel=2
arch=('x86_64')
pkgdesc="Plain tool to validate and compare .editorconfig files (binary release)"
url="https://github.com/aegoroff/editorconfiger"
license=('MIT')
source=("https://github.com/aegoroff/editorconfiger/releases/download/${pkgver}/editorconfiger-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('cff46889b3cbdbf1f361d065db674cc82919cf627fc1801afb5b22ddcc25fc76')

build() {
    return 0
}

package() {
    install -Dm0755 "editorconfiger" "$pkgdir/usr/bin/editorconfiger"
}
