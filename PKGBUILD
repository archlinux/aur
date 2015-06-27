# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Chaoswizard <chaoswizard@gmail.com>
_name=feedgenerator
pkgname="python-${_name}"
pkgver=1.7
pkgrel=2
pkgdesc="Standalone version of django.utils.feedgenerator (python3)."
url="http://pypi.python.org/pypi/feedgenerator"
arch=('any')
license=('GPL')
depends=('python' 'python-pytz' 'python-six')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('92978492871342ad64e8ae0ccfcf200c')
sha256sums=('5d6b0b10134ac392be0c0c3a39c0e1d7e9c17cc7894590f75981e3f497a4a60f')

package() {
  cd "${_name}-${pkgver}"
  python ./setup.py install --root="${pkgdir}"
}
