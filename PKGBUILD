# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Oliver Mangold <omangold@gmail.com>

_name=uncompyle6
pkgname="python-${_name}"
pkgver=3.7.4
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
depends=('python-spark-parser>=1.8.9' 'python-spark-parser<1.9.0' 'python-xdis>=5.0.4' 'python-xdis<5.1.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('af8330861bf940e7a3ae0f06d129b8e645191a36bf73ca15ff51997a837d41f8')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
