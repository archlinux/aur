# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-ponylang"
pkgver=0.2.8
pkgrel=1
pkgdesc="Ponylang Material theme for MkDocs"
url="https://github.com/ponylang/mkdocs-theme"
license=("MIT")
arch=("any")
depends=("mkdocs" "pymdown-extensions" "python-pygments")
conflicts=("python-mkdocs-material")
makedepends=("python-setuptools" "python-wheel")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=("3d2ff814f84b32c54975ffef12430428247ee4506105991d42e249ac8a1ac45f")

build(){
 cd "mkdocs-theme-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs-theme-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
