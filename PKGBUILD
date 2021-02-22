# Maintainer: BBaoVanC <bbaovanc@bbaovanc.com>
pkgname=nekofetch
pkgver=1.3.2
pkgrel=2
pkgdesc="neofetch but with nekos"
license=('GPL3')
arch=(any)
url="https://github.com/propruhh/nekofetch"
depends=(curl jq jp2a neofetch)
optdepends=('imagemagick: support for kitty image backend')
makedepends=(git make)
provides=(${pkgname})
source=("https://github.com/proprdev/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e5e82c03385948fb33376d8a453589ebd5a9f2c7856503fbdfd568da9375c4da')

package() {
    cd "${pkgname}-${pkgver}"
    PREFIX=${pkgdir}/usr make install
}
