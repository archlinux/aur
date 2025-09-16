# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=cinnamon-doc
pkgver=6.4.8
_pkgver=xia
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
sha256sums=('f841ac60c685da181171c0aee675eb00b7b8646ea40fc8b2bfd4f98b2ffa1aa8')

package() {
    tar xf "${srcdir}/data.tar.xz"
    cp -r usr "$pkgdir"
}
