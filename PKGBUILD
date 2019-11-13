# Maintainer: Payson Wallach <payson@paysonwallach.com>

_name=TakeTheTime
pkgname=python-takethetime
pkgver=0.3.1
pkgrel=1
pkgdesc="A time-taking library for Python."
arch=(any)
url="https://github.com/ErikBjare/TakeTheTime"
license=(custom:)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('ef7414c5776087754abfe073cf6e6430')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
