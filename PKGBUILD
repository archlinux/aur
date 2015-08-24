# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Raansu <gero3977@gmail.com>

pkgname=acd_cli
pkgver=0.3.0a5
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
sha256sums=('136e981f1cec4a49b0775829810fac6494c6935686649b42cf8fcf2e7ca92895')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
