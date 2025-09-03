# Maintainer: sfn

pkgname=python-pyseq
pkgver=0.9.0
pkgrel=1
pkgdesc="Python sequence string module"
arch=(any)
url="https://pyseq.rsgalloway.com/#"
license=('BSD-3-Clause ')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/rsgalloway/pyseq.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py sdist
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
