# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=schedule
pkgname=python-schedule
pkgver=0.6.0
pkgrel=1
pkgdesc='Python job scheduling for humans.'
arch=('any')
url="https://github.com/dbader/$_name"
license=('MIT')
depends=('python>=2.3')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f9fb5181283de4db6e701d476dd01b6a3dd81c38462a54991ddbb9d26db857c9')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
