# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-mermaid2-plugin"
pkgver=0.5.1
pkgrel=1
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-mermaid2-plugin-git")
replaces=("python-mkdocs-mermaid2-plugin-git")
depends=("mkdocs" "python-jsbeautifier")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("a267b77d0e80336ca12a72851209e90a07ba86b3551fa5422f3cd2ee1886f38a")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
