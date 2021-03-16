# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=nekofetch
pkgver=1.4
pkgrel=1
pkgdesc="neofetch but with nekos"
license=('GPL3')
arch=(any)
url="https://github.com/proprdev/nekofetch"
depends=(curl jq jp2a neofetch)
optdepends=('imagemagick: support for kitty image backend')
makedepends=(git make)
provides=(${pkgname})
source=("https://github.com/proprdev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d0631a63c6d511c3fc119793ea3c1a31f4051163bf3dbf0bf22dc19a437fa41c')

package() {
    cd "${pkgname}-${pkgver}"
    PREFIX=${pkgdir}/usr make install
}
