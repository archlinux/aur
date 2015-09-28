# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Raansu <gero3977@gmail.com>

pkgname=acd_cli
pkgver=0.3.0a6
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
sha256sums=('bb85fc9df4536a5ba1b7f54d9353e3e3f919c4d2e622a1b2294ced34b65b93f6')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
