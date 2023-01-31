# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=python-uniseg
_pkgname=uniseg
pkgver=0.7.2
pkgrel=1
pkgdesc="A Python package to determine Unicode text segmentations."
arch=('x86_64')
url="https://bitbucket.org/emptypage/uniseg-py"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-uniseg')
conflicts=('python-uniseg')
source=("https://files.pythonhosted.org/packages/21/33/1ffdf2e7f003b59c2fd60f2a4375a6c7320d598b1ac7abc4521d138330bc/uniseg-0.7.2.zip")
md5sums=('867ea43e3efe915f4294eb10ea9e9886')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
