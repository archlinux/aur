# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=cinnamon-doc
pkgver=4.2.0
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
sha256sums=('b6badf9107f00ab3d902e125476b931ce375a4163f338ceb50613e92f60645a7')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
