# Maintainer: Eric Waller <ewwaller@gmail.com>

pkgname=dup.py
pkgver=1.0
pkgrel=3
pkgdesc='Duplicate File manager with multimedia geolocation metadata extensions'
arch=('any')
url='https://github.com/ewwaller/dup.py'
license=('GPL3')
depends=('python' 'sqlite' 'argparser-python')
optdepends=('python-argcomplete' 'python-gobject' 'libgexiv2')
makedepends=('git')
source=("git+https://github.com/ewwaller/dup.py.git")
md5sums=('SKIP')

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 dup.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
}
