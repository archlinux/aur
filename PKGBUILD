# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname='python-cymruwhois'
pkgver=1.6
pkgrel=4
pkgdesc='Client for the whois.cymru.com service'
arch=('any')
url='https://pythonhosted.org/cymruwhois'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JustinAzoff/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('357bd4beaab4c857062984cfd6b85606e3ff6b39e6e5420f428961ab2a9f2434')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
