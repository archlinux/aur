# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname="python-django-sortedm2m"
pkgver=3.0.2
pkgrel=1
pkgdesc="A transparent sorted ManyToMany field for django"
url="https://github.com/jazzband/django-sortedm2m"
depends=("python-django")
makedepends=("python-setuptools")
license=("BSD")
arch=("any")
source=("https://github.com/jazzband/django-sortedm2m/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("f14b86ab4f610de42937c11058664b2f8e9b722ae42f0197c448125eb9895777")

package(){
 cd "django-sortedm2m-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
