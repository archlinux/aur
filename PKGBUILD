# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Oliver Mangold <omangold@gmail.com>

_name=uncompyle6
pkgname="python-${_name}"
pkgver=3.9.0
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
depends=('python-spark-parser>=1.8.9'
         'python-spark-parser<1.9.0'
         'python-xdis>=6.0.2'
         'python-xdis<6.1.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1e6a902de60ea5c3f7d2af7e2745006b4e4b9bdede888a07f8441c9938f2ee7d')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
