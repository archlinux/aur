# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=pytr
pkgname="python-${_name}"
pkgver=0.3.1
pkgrel=0
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
sha256sums=('f621618b3ddd679698e822987c9f791344a4ae68136090d2db9325ffffe9a9f0')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
