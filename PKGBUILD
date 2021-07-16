# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-blspy
pkgver=1.0.3
pkgrel=1
pkgdesc='Python BLS Signatures implementation'
url='https://github.com/Chia-Network/bls-signatures'
arch=('x86_64' 'aarch64')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-wheel')
source=("git+https://github.com/Chia-Network/bls-signatures#tag=$pkgver") # setup.py fails if .git metadata is not present
sha256sums=('SKIP')

package() {
	cd bls-signatures
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
