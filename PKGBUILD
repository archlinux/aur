# Maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>
pkgname=mkdocs-static-i18n-plugin
_pkgname=mkdocs-static-i18n
pkgver=0.22
pkgrel=1
pkgdesc="MkDocs i18n plugin using static translation markdown files"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("https://github.com/ultrabug/mkdocs-static-i18n/archive/refs/tags/${pkgver}.zip")
md5sums=('1c8819239eddb1d2840ed9f8e923f49e')

build(){
 cd "$_pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$_pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
