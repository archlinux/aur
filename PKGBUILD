# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
pkgver=1.1.4
pkgrel=2
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url=https://github.com/mailgun/expiringdict
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/e/expiringdict/expiringdict-$pkgver.tar.gz)
sha256sums=('9275c3f3aa6cabe394355b6454100eb1cdfe395c6b592c26603a2a0f9e3a0587')

package() {
  cd expiringdict-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
