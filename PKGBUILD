# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.6.0
pkgrel=1
pkgdesc='User-friendly CLI for OAuth2'
arch=('x86_64' 'arm64' 'armv6')
url="https://github.com/cloudentity/oauth2c"
license=('Apache')
source=(
    "${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_Linux_${arch}.tar.gz"
)

package() {
    cd $srcdir
    install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('24b3ab2b677b1666769c8fb0d1ffe6cc21bab0d330cc9eb87d4a98c6b960d8e4')
