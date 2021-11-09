# Maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>
pkgname=mkdocs-static-i18n-plugin
_pkgname=mkdocs-static-i18n
pkgver=0.21
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("https://github.com/ultrabug/mkdocs-static-i18n/archive/refs/tags/${pkgver}.zip")
md5sums=('9cd5c7ddf8b0066129f96118c4c92aa9')

build(){
 cd "$_pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$_pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
