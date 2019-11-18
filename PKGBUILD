# Maintainer: ValHue <vhuelamo@gmail.com>
#
# Contributor: ValHue <vhuelamo@gmail.com>
#
_pkgname="pango"
pkgname="${_pkgname}-legacy"
pkgver="1.44.1"
pkgrel="1"
pkgdesc="A library for layout and rendering of text. This is the latest supported version without harfbuzz version error (Harfbuzz version too old (1.4.2))"
url="https://www.pango.org/"
arch=('x86_64')
license=(LGPL)
depends=(libthai cairo libxft harfbuzz fribidi)
source=(
"${_pkgname}-${pkgver}.tar.gz::https://archive.archlinux.org/packages/p/pango/pango-1%3A1.44.1-1-x86_64.pkg.tar.xz"
)
sha256sums=('ad55288cf833f77b441bb04c5b3351991ebc346a2b6aa9d7a8f07917d78f2d8c')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    mv ./usr ${pkgdir}/opt/${pkgname}
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
