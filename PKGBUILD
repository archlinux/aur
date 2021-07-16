# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-clvm
pkgver=0.9.7
pkgrel=1
pkgdesc="Chia Lisp Virtual Machine"
url='https://github.com/Chia-Network/clvm'
arch=('x86_64' 'aarch64')
license=('Apache')
depends=('python' 'python-blspy>=0.9.0')
makedepends=('python-setuptools')
source=("git+https://github.com/Chia-Network/clvm#tag=$pkgver") # setup.py fails if .git metadata is not present
sha256sums=('SKIP')

package() {
	cd clvm
	python setup.py install --root="$pkgdir" --optimize=1
}
