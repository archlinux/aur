# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=git-iris-bin
pkgver=2.0.9
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

sha256sums_x86_64=('6848ff28c223431fc8f13b073ce3688e099c11a1ad4e9c471b2a6f2ad03560c1')
sha256sums_aarch64=('4136e2e0a884acf0dadf8b8573f1f31a9e1d5236f952f75580d931d5be38b877')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-iris"
}
