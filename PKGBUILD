# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2023.01.0
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("comet-${pkgver}.linux.exe::https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha1sums=('a7759a7e945ad73f838ef0a161ccfd637c9ec23e')

package() {
    install -D "$srcdir/comet-${pkgver}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

