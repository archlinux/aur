# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

_pkgname=tzlocal
pkgname=python-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom')
depends=('python-pytz')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('438f122d684c951b22cb98aecc80fdb961b84e69542bf878c6b9a9419de09a8b')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
