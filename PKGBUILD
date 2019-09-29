# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-django-easy-thumbnails
pkgver=2.6.0
pkgrel=1
pkgdesc="Highly configurable thumbnail creation and caching"
url="http://github.com/SmileyChris/easy-thumbnails"
depends=('python-django' 'python-pillow')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/ae/37/442523964379e1076a4e9c29a89861f44e8c237fa6857e71b113cb2cb5bd/easy-thumbnails-2.6.tar.gz")
sha512sums=('14e4d70978ffbfbaea1a7e3283089ba5162d868bc5c98d3e0ed32df878884168b65006449f595e42be0f9c9d2ad4bda4de54449173340ab35c7cfb13e547a132')

package() {
    cd "${srcdir}/easy-thumbnails-2.6"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
