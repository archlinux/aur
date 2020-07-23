# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-rusenttokenize
pkgver=0.0.5
pkgrel=1
pkgdesc='Rule-based sentence tokenizer for Russian language'
arch=('any')
url='https://pypi.org/project/rusenttokenize'
license=('Apache')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/6d/76/1226e1ddc11ad492a191664a4926c607bcbf1e5b352134ca6f83c4af8205/rusenttokenize-${pkgver}.tar.gz")
sha256sums=('b061b0ea40e880558dfe35a0040010c021007e1779517b25c8d47ba145c028c3')

package() {
  cd "rusenttokenize-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}