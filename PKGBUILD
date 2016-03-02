# Maintainer: Loic Pefferkorn <loic-archlinux@loicp.eu>
pkgname=python-digitalocean
pkgver=1.8
pkgrel=1
pkgdesc="Digitalocean.com API to manage droplets and images"
arch=('any')
url="https://pypi.python.org/pypi/python-digitalocean"
license=('GPL')
depends=('python-requests')
source=("https://pypi.python.org/packages/source/p/python-digitalocean/python-digitalocean-${pkgver}.tar.gz")
sha256sums=('dd8555037e6835f2aae460ed06cc3be3b2df9a34f66a3fc0fae63d001cba06af')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

