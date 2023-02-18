# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-mutable
pkgname=python-$_pkgname

pkgver=1.2.0
pkgrel=1
pkgdesc="flake8 extension for mutable default arguments"

url='https://github.com/ebeweber/flake8-mutable'
arch=('any')
license=('MIT')

depends=('python')
makedepends=('python-wheel' 'python-pip' 'python-setuptools')

source=("https://github.com/ebeweber/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4b65ae7468968b4a202521f65be58a4fa3e583c29c8563d769134fe84f7243d0aa9e32146d91f0a450c782bb8b76a7642251acd0f278c9a639e2c1dbbf03dd46')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

