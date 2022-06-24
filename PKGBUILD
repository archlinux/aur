# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-git-authors-plugin"
pkgver=0.6.4
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
sha256sums=('ce423077fd243b8f200a8512efad07403fa3f85d0a12abee64c8d828ce99e61a')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
