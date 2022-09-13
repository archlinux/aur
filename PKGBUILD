# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2022.01.2
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha1sums=('fdcf2a9f4143caa542905649ab7b78569748ec4b')

package() {
    install -D "$srcdir/comet.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

