# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-material-pymdownx-extras"
pkgver=1.5.6
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
sha256sums=('bc57bb13073dce2d9c140bfc599f80fb1ffb841759fffbb5b75f7fecf0b283ac')

build(){
 cd "mkdocs_pymdownx_material_extras-$pkgver"
 python setup.py build
}

package(){
 cd "mkdocs_pymdownx_material_extras-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
