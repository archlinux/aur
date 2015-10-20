# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Raansu <gero3977@gmail.com>

pkgname=acd_cli
pkgver=0.3.1
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
sha256sums=('2d4f68e9345174b4d5b292bcf69aadc36914ddd49eeb9eb7b798b240d00884ed')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
