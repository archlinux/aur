# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=pytr
pkgname="python-${_name}"
pkgver=0.2.5
pkgrel=2
pkgdesc='This is a library for the private API of the Trade Republic online brokerage.'
arch=('any')
url="https://github.com/pytr-org/pytr"
makedepends=('python-setuptools')
license=('MIT')
provides=("python-${_name}")
conflicts=("python-${_name}")
depends=(
  'python' 'python-shtab' 'python-babel' 'python-websockets' 'python-requests-futures' 'python-pygments' 'python-pathvalidate'
  'python-packaging' 'python-ecdsa' 'python-coloredlogs' 'python-certifi'
  )
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e88f21d8fc801c185f0e5e69234266c55e6639cb077fdafb571ce7f70183424e')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}


