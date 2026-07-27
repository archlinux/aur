# Maintainer: Chillcog <chillcog@chillcog.com>
pkgname=sharkfetch
pkgver=1.71.0
pkgrel=1
pkgdesc="A custom system fetch script with a sharky!"
arch=('any')
url="https://git.chillcog.com/chillcog/sharkfetch"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('46851a932ebd0f85e08f59e57ad5a91a5d572be95622117c4d083fee431785c7')

package() {
    install -Dm755 "${srcdir}/sharkfetch/sharkfetch" "${pkgdir}/usr/bin/sharkfetch"
}