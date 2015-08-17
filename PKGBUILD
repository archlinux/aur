# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Raansu <gero3977@gmail.com>
# Contributor: ShapeShifter499

pkgname=acd_cli
pkgver=0.3.0a4
pkgrel=1
pkgdesc="a command line interface to
Amazon Cloud Drive and allows mounting your cloud drive
using FUSE for read access."
arch=('any')
url="https://github.com/yadayada/acd_cli"
license=('GPL')
depends=('python-appdirs' 'python-requests>=2.1.0'
'python-sqlalchemy' 'python-dateutil'
'python-requests-toolbelt')
makedepends=('python' 'python-setuptools')
source=("https://github.com/yadayada/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1f1d61394be741f70a410c921f0b7cef12ba3def86df84851461e7cc562368ba')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
