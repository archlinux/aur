# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=nekofetch
pkgver=1.2.2
pkgrel=1
pkgdesc="neofetch but with nekos"
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
makedepends=(git make)
provides=(${pkgname})
source=("https://github.com/propruhh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bc932af7f1f009697585d74e952a967ac1d9fbdc7cf6e16fe129cdf2a6f99a7f')

package() {
    cd "${pkgname}-${pkgver}"
    PREFIX=${pkgdir}/usr make install
}
