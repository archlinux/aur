# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-ezlinks-plugin"
pkgver=0.1.14
pkgrel=1
pkgdesc="MkDocs plugin to automagically generate relative links between markdown pages"
url="https://github.com/orbikm/mkdocs-ezlinks-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-ezlinks-plugin-git")
replaces=("python-mkdocs-ezlinks-plugin-git")
depends=("mkdocs" "python-pygtrie-git")
makedepends=("python-setuptools")
source=("$url/releases/download/v_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e26cbe97429a27eb14dc660f21fb6dd384f0f1c440ad6e61424bdf79ad439e61')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
