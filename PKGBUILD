# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=git-iris-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="An intelligent agent that understands your code and crafts perfect Git artifacts"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperb1iss/git-iris"
license=('Apache-2.0')
provides=('git-iris')
conflicts=('git-iris')
depends=('gcc-libs' 'openssl')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/hyperb1iss/git-iris/releases/download/v${pkgver}/git-iris-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/hyperb1iss/git-iris/releases/download/v${pkgver}/git-iris-linux-arm64")

sha256sums_x86_64=('2026b72c8ced9411414093146758048823a7b4352cc3132f590383eae361dfd7')
sha256sums_aarch64=('f5d0140bfb6612ec931a98a8cbdefcf0663a10c507a4491f25fc14903c3dcd41')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-iris"
}
