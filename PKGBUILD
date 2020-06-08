# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2019.01.5
pkgrel=2
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="http://comet-ms.sourceforge.net/"
license=('Apache')
depends=()
makedepends=()
optdepends=()
install="${pkgname}.install"
source=("download-${pkgver}-${pkgrel}::https://sourceforge.net/projects/${pkgname%-bin}/files/comet_${pkgver//./}.zip/download")
sha1sums=('8bdd58abda2227379f6f169c4cb5a99e1c911afd')

package() {
    install -D "$srcdir/comet.${pkgver//./}.linux.exe" "$pkgdir/usr/bin/comet.exe"
    install -D -m 644 -t "$pkgdir/usr/share/${pkgname%-bin}" "$srcdir/peff/PSI-MOD.obo"
}

