# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=cinnamon-doc
pkgver=4.0.10
_pkgver=tessa
pkgrel=1
pkgdesc="Code documentation for various Cinnamon components."
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=('GPL3')
depends=('cinnamon' 
    'devhelp')
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_all.deb")
sha256sums=('82599c542ea3b0d49029e084a5b34fcac54c9da5532322c3d5c91df3aaea0743')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
