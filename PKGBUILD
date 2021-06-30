# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-rss-plugin"
pkgver=0.17.0
pkgrel=1
pkgdesc="MkDocs plugin to generate a RSS feeds for created and updated pages, using git log"
url="https://guts.github.io/mkdocs-rss-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-rss-plugin-git")
replaces=("python-mkdocs-rss-plugin-git")
depends=("mkdocs" "python-jinja" "python-gitpython")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Guts/mkdocs-rss-plugin/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("500bea020e5941be8186aa6a1a4adaa4e2447042ac35c883486196efa6ed7918")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
