# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('pipdeptree')
pkgver='0.6.0'
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
url="https://github.com/naiquevin/pipdeptree"
depends=('python-pip')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('48293e697281a53a16b23c2d95e596a6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
