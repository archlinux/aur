# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyupset'
pkgver=0.1.post3
pkgrel=1
pkgdesc="Python implementation of the UpSet suite of visualisation methods by Lex, Gehlenborg et al."
arch=('any')
url="https://github.com/lwgray/pyEntrezId"
license=('MIT')
depends=('python' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools')
rovides=('python-pyupset')
conflicts=('python-pyupset')
options=(!emptydirs)
source=("https://github.com/ImSoErgodic/py-upset/archive/v${pkgver}.tar.gz")
md5sums=('563dbc3e945280fb4d902b140cc5acd1')

package() {
  cd "${srcdir}/py-upset-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
