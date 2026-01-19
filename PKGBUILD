# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=6.6.5
_pkgver=zena
pkgrel=1
pkgdesc='Code documentation for various Cinnamon components.'
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=('GPL-3.0-or-later')
depends=(
    'cinnamon'
    'devhelp'
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_all.deb")
sha256sums=('20d0d998dc399cc674a2d95af0601c32cc4041fbae5ea3ef96918490b2e22f7e')

package() {
    tar xf "${srcdir}/data.tar.xz"
    cp -r usr "$pkgdir"
}
