# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-itypes
_pkgbase="${pkgbase#python-}"
pkgname=python-itypes
pkgver=1.2.0
pkgrel=1
pkgdesc='Basic immutable container types for Python.'
arch=(any)
url='https://github.com/tomchristie/itypes'
license=(BSD)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://github.com/tomchristie/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('4b01b8625dff71c2d566380647bbc55fad4c02430426b9fcd71be6f0d090c1bb')

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
