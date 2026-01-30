# Maintainer farwayer <farwayer@gmail.com>
pkgname=puncover
pkgver=0.7.0
pkgrel=1
pkgdesc="Analyses C/C++ build output for code size, static variables, and stack usage"
arch=(any)
url="https://github.com/HBehrens/puncover"
license=('MIT')
depends=(python-flask)
makedepends=(python-installer python-wheel)
provides=(puncover)
conflicts=(puncover-git)
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname}/${pkgname}-$pkgver-py3-none-any.whl")
noextract=()
sha256sums=('e780dbd174c5ddd2854f83938cf6ce16e13adfdcb3bf3730421ac781809ef382')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}

