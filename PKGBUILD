# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=comet-ms-bin
pkgver=2025.03.0
pkgrel=1
pkgdesc="Comet: an open source tandem mass spectrometry (MS/MS) sequence database search tool"
arch=('x86_64')
url="https://github.com/UWPR/Comet"
license=('Apache')
depends=()
makedepends=()
optdepends=()
source=("comet-${pkgver}.linux.exe::https://github.com/UWPR/Comet/releases/download/v${pkgver}/comet.linux.exe")
sha256sums=('a554253d94491c32cb51af668071f32c7e85e7ea55ac9fb824c40ff9a1b8876b')

package() {
    install -D "$srcdir/comet-${pkgver}.linux.exe" "$pkgdir/usr/bin/comet.exe"
}

