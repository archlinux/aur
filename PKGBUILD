# Maintainer: Autumn Boyhan <autumn@crisismodel.com>

pkgname=python-uniseg
_pkgname=uniseg
pkgver=0.7.1.post2
pkgrel=1
pkgdesc="A Python package to determine Unicode text segmentations."
arch=('x86_64')
url="https://bitbucket.org/emptypage/uniseg-py"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-uniseg')
conflicts=('python-uniseg')
source=("https://files.pythonhosted.org/packages/40/42/e725e1812e539053dff0c09aa20f4e0551736ca5b220704888f6ef314372/uniseg-0.7.1.post2.zip")
md5sums=('649af359840efeb4f82ba8a0098dc4b6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
