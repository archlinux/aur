# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=git-iris-bin
pkgver=2.1.0
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

sha256sums_x86_64=('e3096dac3d08a2d90247829ee40682119ee332053c496b9ab3f7fba18ffc214f')
sha256sums_aarch64=('2baf8b830bb2aa347d371b0b987ea58666c18da3543fffbc56ad629e765228f7')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-iris"
}
