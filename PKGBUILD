# Maintainer: Conrad Sachweh <conrad+aur@spamthis.space>
pkgname=python-fastdtw
_pkgname=fastdtw
pkgver=0.3.2
pkgrel=1
pkgdesc="Python implementation of FastDTW, whis is an approximate Dynamic Time Warping (DTW) algorithm that provides optimal or near-optimal alignments with an O(N) time and memory complexity."
url="https://github.com/slaypni/fastdtw"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('63d55d14dbc4a40d2d1ceecb756d0ee4')

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  python setup.py install --root="${pkgdir}/" --optimize=1
}
