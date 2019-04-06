# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=Colr
pkgname=python-colr
pkgver=0.8.6
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('63e763129eef15f930a74496e8e5c5aac2b76663e73a9f9260b44687542fb5e11bd6cfcfba3fd1d4978620ff551d5f36a06f26d6f4b845a575a7f0b319aae02d')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
