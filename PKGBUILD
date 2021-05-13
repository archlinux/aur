# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2020.01.4
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="http://comet-ms.sourceforge.net/"
license=('Apache')
depends=()
makedepends=()
optdepends=()
install="${pkgname}.install"
source=("download-${pkgver}-${pkgrel}::https://sourceforge.net/projects/${pkgname%-bin}/files/comet_${pkgver//./}.zip/download")
sha1sums=('67561dd8ff5dbe0a1f7c5bd913c3c8259d5aa69f')

package() {
    install -D "$srcdir/comet.${pkgver//./}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

