# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=cinnamon-doc
pkgver=4.2.3
_pkgver=tina
pkgrel=1
pkgdesc='Code documentation for various Cinnamon components.'
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=(GPL3)
depends=(
    cinnamon
    devhelp
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_all.deb")
sha256sums=('d0e38f2021eabfbba3a1f2d587843bbacee632c8b069378358c177552eabedee')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
