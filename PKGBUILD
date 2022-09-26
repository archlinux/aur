# Maintainer: pappy <pa314159@users.noreply.github.com>
pkgbase=python-sarge
pkgname=('python-sarge')
pkgver=0.1.6
pkgrel=2
_tag=81dc3347651b
pkgdesc="The sarge package provides a wrapper for subprocess which provides command pipeline functionality."
arch=('any')
url="https://bitbucket.org/vinay.sajip/sarge"
license=('GPL')
makedepends=('python')
source=("https://bitbucket.org/vinay.sajip/sarge/get/${pkgver}.tar.gz")
sha512sums=('8cf77141f516297cfc029b6255618f497ab94453214e61ef280dd571019a40f461d81ab9bb793b08de2dae89832e50aaf687205814b22c305e03883b9dc3bfea')
depends=('python')
conflicts=('python-sarge-git')

package() {
  cd "${srcdir}/vinay.sajip-sarge-${_tag}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

