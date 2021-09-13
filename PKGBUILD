# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=0.10.0
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages"
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-git-revision-date-localized-plugin")
replaces=("python-mkdocs-git-revision-date-localized-plugin")
depends=("mkdocs" "python-gitpython" "python-babel>=2.7.0")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b12adc64ba7f0175759be2f1f567a3d9d9c83bce5995dd57d98d7108cfd159d1')

build(){
    cd "$pkgname-$pkgver"
    python setup.py build
}

package(){
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
