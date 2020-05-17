# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-django-easy-thumbnails
pkgver=2.7.0
pkgrel=1
pkgdesc="Highly configurable thumbnail creation and caching"
url="http://github.com/SmileyChris/easy-thumbnails"
depends=('python-django' 'python-pillow')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/11/c8/950c50cdf39702d64f5781e6735f539d76044e9461c63fc20a06de324316/easy-thumbnails-2.7.tar.gz")
sha512sums=('614ed1e7f7cffa3e78fa75b43c14b014244439decf9f192814a5871b06caab4cf92ce6e35aa3a363b56480eef9490872a0b28f217f9293ad7b11d7499e49e3fa')

package() {
    cd "${srcdir}/easy-thumbnails-2.7"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
