# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2021.02.0
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha1sums=("6bfbe4e0b4c115a874570978b5c2c25efed9a7a0")

package() {
    install -D "$srcdir/comet.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

