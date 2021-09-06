# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2021.01.0
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
sha1sums=('c20a9234495ea59062492f73c02379bc7f7e7176')

package() {
    install -D "$srcdir/comet.${pkgver//./}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

