# Maintainer: Jerry <isjerryxiao at outlook dot com>
_srcname=pacroller
pkgname=pacroller
pkgver=0.0.1
pkgrel=1
pkgdesc="Unattended upgrade for archlinux"
arch=('any')
url="https://github.com/isjerryxiao/pacroller"
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('git')
source=("$_srcname::git+https://github.com/isjerryxiao/pacroller#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
