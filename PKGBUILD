# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-redirects"
pkgver=1.2.1
_sdist=mkdocs_redirects
pkgrel=2
pkgdesc="Open source plugin for Mkdocs page redirects"
url="https://github.com/datarobot/mkdocs-redirects"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-redirects-git")
replaces=("python-mkdocs-redirects-git")
depends=("mkdocs>=1.1.1")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
sha256sums=('5e980330999299729a2d6a125347d1af78023d68a23681a4de3053ce7dfe2e51')

build(){
 cd "${_sdist}-${pkgver}"
 python setup.py build
}

package(){
 cd "${_sdist}-${pkgver}"
 python setup.py install --root="$pkgdir" --optimize=1
}
