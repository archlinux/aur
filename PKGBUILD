# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2018.01.2
pkgrel=3
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="http://comet-ms.sourceforge.net/"
license=('Apache')
depends=()
makedepends=()
optdepends=()
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname%-bin}/files/comet_${pkgver//./}.zip/download")
sha1sums=('6c911d91b90f758e1773c1bf5cb5f5e7ef3d7a85')

package() {
    install -D "$srcdir/comet.${pkgver//./}.linux.exe" "$pkgdir/usr/bin/comet.exe"
    install -D -m 644 -t "$pkgdir/usr/share/${pkgname%-bin}" "$srcdir/peff/PSI-MOD.obo"
}

