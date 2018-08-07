# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname=python-godaddypy
pkgver=2.2.6
pkgrel=1
pkgdesc="Library useful for updating DNS settings through the GoDaddy v1 API"
arch=('any')
url="https://github.com/eXamadeus/godaddypy/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eXamadeus/godaddypy/archive/${pkgver}.tar.gz")
sha256sums=('dc77aae35f0490b9735d81d370ca616b334080be094993f41cf8ce44901e441b')

package() {
  cd "$srcdir/godaddypy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
