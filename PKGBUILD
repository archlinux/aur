# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2026.01.0
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("comet-${pkgver}.linux.exe::https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha256sums=('d050e292901bfb19cc3477b0d70212b5863a3ff382119f13a131840dab974e22')

package() {
    install -D "$srcdir/comet-${pkgver}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

