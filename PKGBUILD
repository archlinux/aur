# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-htmlproofer-plugin"
pkgver=0.7.0
pkgrel=1
pkgdesc="MkDocs plugin to validates URL in rendered html files"
url="https://github.com/manuzhang/mkdocs-htmlproofer-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-htmlproofer-plugin-git")
replaces=("python-mkdocs-htmlproofer-plugin-git")
depends=("mkdocs" "python-beautifulsoup4" "python-requests")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('775fa50c8c6fb3a11be9175cd042ba54474c2e64b825420ee47910d52a1d7d76')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
