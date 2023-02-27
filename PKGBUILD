# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=oauth2c
pkgver=1.5.1
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

sha256sums=('733609d710fbf58f33c0605cce403cbca2b615f3e37d55d86aebd06a9cd8d9d9')
