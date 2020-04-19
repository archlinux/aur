# Maintainer : Achilleas Pipinellis <axil archlinux gr>
pkgname=doh-cli
pkgver=0.3
pkgrel=2
pkgdesc="a simple DNS over HTTPS client"
arch=('any')
url="https://pypi.python.org/pypi/doh-cli"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
depends=('python-requests' 'python-dnspython')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
sha256sums=('d42c76c690628b3ed9f6d015ca40214fb030a4065fa52f954a7c59d1bc52ba8d')
