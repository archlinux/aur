pkgname='exabgp'
pkgver=3.4.13
pkgrel=1
pkgdesc=""
url="https://github.com/Exa-Networks/exabgp"
license=('GPL3')
makedepends=('python-distribute')
depends=('python')
arch=('any')
source=("https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/exabgp-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('af4ae996896251de736c10c54584eaa1')
sha1sums=('3725e38058c140455e7388e8852cdd6abe8393a9')
sha256sums=('e92cf3ff9ac72d1be84f7168f4981bd95973f90ebece86958f3357b24e6c0da3')
