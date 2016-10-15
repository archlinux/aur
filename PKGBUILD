# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('pipdeptree')
pkgver='0.7.0'
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
url="https://github.com/naiquevin/pipdeptree"
depends=('python-pip')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/8b/41/85ad719f8e7f76764d2da84c4cd23b50d7639728bb12b0e5ffe405f6e4e0/${pkgname}-${pkgver}.tar.gz")
md5sums=('688330de5d4c854578933b8ff928c457')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
