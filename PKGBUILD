# Maintainer: Riccardo Berto <riccardobrt@gmail.com>

pkgname=('python-datarediset')
_pkgname=('datarediset')
pkgver=0.0.4
pkgrel=1
pkgdesc="Python's dict on top of Redis"
arch=('any')
url="https://github.com/RcrdBrt/datarediset"
license=('GPLv3')
options=('!emptydirs')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c200c67a6286b948c825274399d0c17af1af35ada6446e0f5285b740c8449ae0')

package() {
  depends=('python' 'python-redis' 'redis')
  cd ""$_pkgname-$pkgver""
  python setup.py install --root="$pkgdir/" --optimize=1
}

