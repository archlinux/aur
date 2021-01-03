# Maintainer: Frank Vanderham <twelve dot eighty at gmail dot com>
# Contributor: Sascha Appel <sascha.appel@gmail.com>
pkgname=tuir
pkgver=1.29.0
pkgrel=2
pkgdesc="Browse Reddit from your terminal"
arch=('any')
url="https://gitlab.com/ajak/tuir/"
license=('MIT')
depends=('python-beautifulsoup4' 'python-decorator' 'python-kitchen' 'python-six' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("git+https://gitlab.com/ajak/tuir.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

