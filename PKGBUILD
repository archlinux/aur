# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=git-iris-bin
pkgver=2.0.3
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

sha256sums_x86_64=('e99045436c3855ad4c6101f2c89d558163031da35f4c408bbca3fb0b2285b5f2')
sha256sums_aarch64=('646f01998673c4e81a5b977d25364c14c2ed7e759c58af63ae739d74f240df65')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-iris"
}
