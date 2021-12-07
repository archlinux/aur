# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-ezlinks-plugin"
pkgver=0.1.13
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
sha256sums=('2b489271aebf2e4c4d52338e1e0a7391feb50baf83634083656bd02a34b8c382')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
