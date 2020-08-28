# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname='oelint-adv'
pkgver=1.26.0
pkgrel=1
pkgdesc='Linter for bitbake recipes based in OE Styleguide'
url='https://github.com/priv-kweihmann/oelint-adv'
arch=('any')
license=('BSD 2-Clause')
depends=('python' 'python-setuptools')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('83bf52b0cb8ec69d46914253cf37cfbe035523e44d23d83e99c1b2590e0e76e6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
