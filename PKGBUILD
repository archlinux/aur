# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=nekofetch
pkgver=1.3
pkgrel=1
pkgdesc="neofetch but with nekos"
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
makedepends=(git make)
provides=(${pkgname})
source=("https://github.com/propruhh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fec5a171ec88ef95a9e17c7e8799839101fd70c10de09eccfe28bb27ec0e32a4')

package() {
    cd "${pkgname}-${pkgver}"
    PREFIX=${pkgdir}/usr make install
}
