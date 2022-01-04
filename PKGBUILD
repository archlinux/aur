# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-material-pymdownx-extras"
pkgver=1.5.7
pkgrel=1
pkgdesc="MkDocs Material additions used for pymdownx documentation"
url="https://github.com/facelessuser/mkdocs_pymdownx_material_extras"
license=("MIT")
arch=("any")
provides=("mkdocs-pymdownx-material-extras")
conflicts=("python-mkdocs-material-pymdownx-extras-git")
replaces=("python-mkdocs-material-pymdownx-extras-git")
depends=("mkdocs-material")
makedepends=("python-setuptools" "git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3dfeade09a8e4aee42c233ae1a46363df0a1c1f5e25f9da80eb1c1e718665841')

build(){
 cd "mkdocs_pymdownx_material_extras-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs_pymdownx_material_extras-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
