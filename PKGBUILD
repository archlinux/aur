# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname=python-godaddypy
pkgver=2.3.3
pkgrel=1
pkgdesc="Library useful for updating DNS settings through the GoDaddy v1 API"
arch=('any')
url="https://github.com/eXamadeus/godaddypy/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eXamadeus/godaddypy/archive/${pkgver}.tar.gz")
sha256sums=('ef7b633ea02cf977c3e02bea37db883ea8b9884ef37ba3bf5e4a61259d232fbd')

package() {
  cd "$srcdir/godaddypy-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
