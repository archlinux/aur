# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2018.01.3
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="http://comet-ms.sourceforge.net/"
license=('Apache')
depends=()
makedepends=()
optdepends=()
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname%-bin}/files/comet_${pkgver//./}.zip/download")
sha1sums=('936af7a986c3a90786ed518fcb842a9c0d0fe320')

package() {
    install -D "$srcdir/comet.${pkgver//./}.linux.exe" "$pkgdir/usr/bin/comet.exe"
    install -D -m 644 -t "$pkgdir/usr/share/${pkgname%-bin}" "$srcdir/peff/PSI-MOD.obo"
}

