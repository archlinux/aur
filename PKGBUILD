# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=nekofetch
pkgver=1.3.1
pkgrel=1
pkgdesc="neofetch but with nekos"
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
makedepends=(git make)
provides=(${pkgname})
source=("https://github.com/propruhh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4a88b19e9f14080320e9b1197be6f9934f596a36d8907181b5c32147b850ebc4')

package() {
    cd "${pkgname}-${pkgver}"
    PREFIX=${pkgdir}/usr make install
}
