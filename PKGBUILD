# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname='oelint-adv'
pkgver=1.4.0
pkgrel=1
pkgdesc='Linter for bitbake recipes based in OE Styleguide'
url='https://github.com/priv-kweihmann/oelint-adv'
arch=('any')
license=('BSD 2-Clause')
depends=('python' 'python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('363a4878bc9b0c48bc14ef3609e2f0053e0003e51cda74f2a5318291468c673a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
