# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=git-iris-bin
pkgver=2.0.8
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

sha256sums_x86_64=('3b11b389a677d920a603237884638d8d15ad2ce6161232cf524b5d91cfa666f5')
sha256sums_aarch64=('8db1dbf2846c7eef1ce9fe11f582d21a46f5a9022447be1e517d214e5693982a')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/git-iris"
}
