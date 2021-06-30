# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-htmlproofer-plugin"
pkgver=0.3.0
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
sha256sums=("fc9d3bae465bd0526ce59a72ea3314d61092ffc724cc541453716d0b215f553c")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
