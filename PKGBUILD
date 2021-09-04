# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-material-extensions"
pkgver=1.0.3
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("mkdocs-material-extensions")
conflicts=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
replaces=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
depends=("mkdocs" "pymdown-extensions")
makedepends=("python-setuptools")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4ed429c0311e099827ead1371eb0eee8ca3c9689d34f4f1c52c9a0876a86a536')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
