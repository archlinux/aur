# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=4.16.1
pkgrel=1
pkgdesc='Human-friendly output for text interfaces using Python'
arch=(any)
url=https://humanfriendly.readthedocs.io
license=(MIT)
depends=(python2)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=(https://pypi.io/packages/source/h/humanfriendly/humanfriendly-$pkgver.tar.gz)
sha256sums=(ed1e98ae056b597f15b41bddcc32b9f21e6ab4f3445f9faad1668675de759f7b)
sha512sums=(c69efd4fb4c56811d7cd81fde0ca367d32db062a5d2ebb22316d2c69f4d6244500d2456680d66a5cb3a72b8d50c640756e92b87ac98d50cbee0d9411e1738bab)

package() {
  cd humanfriendly-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
