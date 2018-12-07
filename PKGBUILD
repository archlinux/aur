# Contributor(s): xgdgsc <xgdgsc@gmail.com>
# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=tcping
pkgver=0.1.1rc1
pkgrel=1
pkgpath='2a/a1/7e8ac7d81a1a89b1cdb8200fee2c0779410a63743806213cb9289ab6ee94'
pkgdesc="Just like icmp ping"
arch=('any')
url="https://github.com/zhengxiaowai/tcping"
license=('MIT')
depends=('python-click' 'python-prettytable' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/${pkgpath}/tcping-${pkgver}.tar.gz")
sha256sums=('557d5e928601e5a31e55abe20c6b9fff18bdc74a1e1d620d6b28b2f7c7a26606')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
