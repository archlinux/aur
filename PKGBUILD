# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2026.01.1
pkgrel=2
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("comet-${pkgver}.linux.exe::https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha256sums=('77edb2ae39b8eae01801160dd9c57033612b5726c2b9e5debc7e81a094a7b618')

package() {
    install -D "$srcdir/comet-${pkgver}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

