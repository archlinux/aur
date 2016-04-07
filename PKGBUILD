# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

_pkgname=tzlocal
pkgname=python-${_pkgname}
pkgver=1.2.2
pkgrel=1
pkgdesc="Tzinfo object for the local timezone"
arch=('any')
url='https://pypi.python.org/pypi/tzlocal'
license=('custom')
depends=('python-pytz')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cbbaa4e9d25c36386f12af9febe315139fdd39317b91abcb42d782a5e93e525d')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
