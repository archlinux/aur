# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

_pkgname=tzlocal
pkgname=python-${_pkgname}
pkgver=1.1.2
pkgrel=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url='https://github.com/regebro/tzlocal'
license=('custom')
depends=('python-pytz')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.zip")
sha256sums=('4d9ddb8d5eab086e3a7c504c6e994ffa85df43e40da4d6be776218be051c677a')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
