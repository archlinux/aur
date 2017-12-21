# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pybigwig'
pkgver=0.3.9
pkgrel=1
pkgdesc="A python extension for quick access to bigWig and bigBed files"
arch=('any')
url="https://github.com/deeptools/pyBigWig"
license=('MIT')
depends=('curl' 'python' 'python-numpy')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/deeptools/pyBigWig/archive/${pkgver}.tar.gz")
md5sums=('1bfb0c95c0e13bb64f6cd88331dcf7ef')

package() {
  cd "${srcdir}/pyBigWig-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
