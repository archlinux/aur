# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-redirects"
pkgver=1.0.1
pkgrel=1
pkgdesc="Open source plugin for Mkdocs page redirects"
url="https://github.com/datarobot/mkdocs-redirects"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-redirects-git")
replaces=("python-mkdocs-redirects-git")
depends=("mkdocs")
makedepends=("python-setuptools" "git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("2ffdbd9de235ab92a02f1a8d56a1bf4f9c2a59a3bc5bc1e32a980f7492b27050")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
