# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-git-authors-plugin"
pkgver=0.3.3
pkgrel=1
pkgdesc="MkDocs plugin to display git authors of a page"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-git-authors-plugin-git")
replaces=("python-mkdocs-git-authors-plugin-git")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/timvink/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("4a5408639384c34ce3f8ff43eaf77ce354f556aef913b7cad35f3545f2488834")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
