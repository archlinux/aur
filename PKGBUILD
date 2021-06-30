# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-cinder"
pkgver=1.2.0
pkgrel=1
pkgdesc="A clean, responsive MkDocs theme"
url="https://sourcefoundry.org/cinder/"
license=("MIT")
arch=("any")
provides=("mkdocs-cinder")
conflicts=("python-mkdocs-cinder")
replaces=("python-mkdocs-cinder")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrissimpkins/cinder/archive/v$pkgver.tar.gz")
sha256sums=("4f20061069650cbea144859989c22743e1d9b00aa1e59aed65471488182a7b8d")

build(){
 cd "cinder-$pkgver"
 python setup.py build
}

package(){
 cd "cinder-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
