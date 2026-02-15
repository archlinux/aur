# Maintainer: Gemini <gemini@example.com>
pkgname=flare-floss-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="FLARE Obfuscated String Solver (Standalone Binary)"
arch=('x86_64')
url="https://github.com/mandiant/flare-floss"
license=('Apache')
depends=('glibc' 'zlib')
provides=('flare-floss')
conflicts=('flare-floss')
source=("floss-v$pkgver-linux.zip::https://github.com/mandiant/flare-floss/releases/download/v$pkgver/floss-v$pkgver-linux.zip")
sha256sums=('40c05a869f34f7e2417b17ca290cc54bd3671ee1f0a2d9bd5103284c01a54666')

package() {
    install -Dm755 "${srcdir}/floss" "${pkgdir}/usr/bin/floss"
}
