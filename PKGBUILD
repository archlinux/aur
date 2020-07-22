# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-class-registry
_pkgname=class-registry
pkgver=2.1.2
pkgrel=1
pkgdesc='The intersection of the Registry and Factory patterns'
url='https://github.com/todofixthis/class-registry'
depends=('python')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/todofixthis/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('365e8e526cdad3730f946e0cb111dcee88bb72305015551d7da4419d18f41d98b960620f03665b684de17d1c868d6723ebdda6960324982e8648e99606315426')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

