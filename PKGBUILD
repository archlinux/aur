# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-redirects"
pkgver=1.2.0
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
sha256sums=('ddd38267d49fdfa19fb2f25b4aed2fb53f0496c818bf3018009c8eaf6676a327')

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
