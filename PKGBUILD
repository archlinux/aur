# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2024.01.0
pkgrel=4
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("comet-${pkgver}.linux.exe::https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha1sums=('345a1915572d0b221b40e7633feaf46d472c52b9')

package() {
    install -D "$srcdir/comet-${pkgver}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

