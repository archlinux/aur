# Maintainer: Sascha Appel <sascha.appel@gmail.com>
pkgname=tuir
pkgver=1.28.3
pkgrel=2
pkgdesc="Terminal UI for Reddit, forked from discontinued rtv"
arch=('any')
url="https://gitlab.com/ajak/tuir/"
license=('MIT')
depends=('python-beautifulsoup4' 'python-decorator' 'python-kitchen' 'python-six' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("git+https://gitlab.com/ajak/tuir.git#tag=v$pkgver")

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('SKIP')
