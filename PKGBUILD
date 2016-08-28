# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Raansu <gero3977@gmail.com>
# Maintainer of acd_cli project: yadayada <https://github.com/yadayada>
pkgname=acd_cli
pkgver=0.3.2
pkgrel=1
pkgdesc="acd_cli provides a command line interface to 
Amazon Cloud Drive and allows mounting your cloud drive 
using FUSE for read access."
arch=('any')
url="https://github.com/yadayada/acd_cli"
license=('GPL')
depends=('python-appdirs' 'python-requests>=2.1.0' 
'python-sqlalchemy' 'python-dateutil' 
'python-requests-toolbelt' 'python-fusepy' 'python-setuptools' 
'python-colorama')
makedepends=('python')
optdepends=('fuse: Filesystem mount support')
provides=('acd_cli')
conflicts=('acd_cli' 'acd_cli-git')
source=(https://github.com/yadayada/acd_cli/archive/${pkgver}.tar.gz)
sha256sums=('f91f17243bd4faa7eb6e410de40d88155704696b9cb6243843d419d327670c61')

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python setup.py install --root="$pkgdir/" --optimize=1
}
