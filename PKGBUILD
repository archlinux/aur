# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-easy-thumbnails"
pkgver=2.7.1
pkgrel=1
pkgdesc="Highly configurable thumbnail creation and caching"
url="http://github.com/SmileyChris/easy-thumbnails"
depends=("python-django" "python-pillow")
makedepends=("python-setuptools" "python-wheel")
license=("BSD")
arch=("any")
source=("https://github.com/SmileyChris/easy-thumbnails/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("27b67b4b721254fbbd0f4fd3bf34e97aa1aecde431b57ab13362a4a3587a24f2")

package(){
 cd "easy-thumbnails-$pkgver"
 python setup.py install --root="${pkgdir}" --optimize=1
}
