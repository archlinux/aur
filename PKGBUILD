# Maintainer: Francesco Pantano <fmount9@autistici.org>
# Contributor: fmount

pkgname=('camimporter')
pkgver="0.1"
pkgrel="1"
pkgdesc="A useful tool to organize your multimedia files importing them from a generic CAMERA"
arch=('i686' 'x86_64')
url="https://github.com/fmount/${pkgname}.git"
license=('MIT')
makedepends=('python2-pillow' 'python2-prettytable' 'python2-six' 'python2-setuptools')
source=("git://github.com/fmount/camimporter.git")
#sha1sum=("SKIP")
md5sums=('SKIP')

build() {
  echo "${srcdir}/${pkgname}"
  cd "${srcdir}/$pkgname"
  echo -e "camimporter version: $pkgver" > PKG-INFO
}

package() {
        cd "${srcdir}/${pkgname}"
        sudo python2 setup.py install --root="$pkgdir/"
}
