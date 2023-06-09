# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=5.8.1
_pkgver=victoria
pkgrel=1
pkgdesc='Code documentation for various Cinnamon components.'
arch=('any')
url="http://packages.linuxmint.com/pool/backport/c/cinnamon"
license=(GPL3)
depends=(
    cinnamon
    devhelp
)
source=("${pkgname}_${pkgver}.deb::${url}/${pkgname}_${pkgver}+${_pkgver}_amd64.deb")
sha256sums=('b8d57f6390dd9df001f28eea7868b4100faf27067d14ce2431970daec40f3a35')

package() {
  tar xf "${srcdir}/data.tar.xz"
  cp -r usr "$pkgdir"
}
