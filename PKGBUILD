# Maintainer: Loic Pefferkorn <loic-archlinux@loicp.eu>
pkgname=python-digitalocean
pkgver=1.10.1
pkgrel=1
pkgdesc="Digitalocean.com API to manage droplets and images"
arch=('any')
url="https://pypi.python.org/pypi/python-digitalocean"
license=('GPL')
depends=('python-requests')
makedepends=('python-setuptools')
_hash=85ff7c732bf7f50caf81d31f71c4293153831705bdbd0fc29152abb567b6
source=("https://pypi.python.org/packages/0a/4c/${_hash}/python-digitalocean-${pkgver}.tar.gz"{,.asc})
sha256sums=('d7e241e119a5689cea3b6d3155e3cf6f295af355379f7f35530850eba85b1e8b'
            'SKIP')
validpgpkeys=('6F13972B14808A27D134F42348143410288E01D6') # Lorenzo Setale

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
