_pkgname=ohmu
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc="View space usage in your terminal."
arch=('any')
url="https://github.com/paul-nechifor/ohmu"
license=("MIT")
makedepends=('python-setuptools')
depends=()
provides=('python-ohmu')
conflicts=('python-ohmu-git')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('ee979bd66bc7672ad3c73a5578be3fc9555cd2e08cb70a5af511a9b20ab14a81')

package() {
	 cd "${srcdir}/${_pkgname}-${pkgver}"
	 python setup.py install --root="${pkgdir}" --optimize=1
}