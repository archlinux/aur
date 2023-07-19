# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-redirects"
pkgver=1.2.1
pkgrel=1
pkgdesc="Open source plugin for Mkdocs page redirects"
url="https://github.com/datarobot/mkdocs-redirects"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-redirects-git")
replaces=("python-mkdocs-redirects-git")
depends=("mkdocs>=1.1.1")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9420066d70e2a6bb357adf86e67023dcdca1857f97f07c7fe450f8f1fb42f861')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
