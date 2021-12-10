# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=5.2.5
_pkgver=una
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
sha256sums=('7137076ad8519e1f44b911491425d6619b09b5d59ad965834ca1410b87db5d55')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
