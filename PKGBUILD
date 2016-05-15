# Maintainer: Eric Waller <ewwaller@gmail.com>

pkgname=wunderground
pkgver=1.0
pkgrel=1
pkgdesc='CLI weather from Weather Underground'
arch=('any')
url='https://github.com/ewwaller/wunderground.py'
license=('GPL3')
depends=('python')
source=("git+https://github.com/ewwaller/wunderground.py.git")
md5sums=('SKIP')

package() {
  cd ${srcdir}/${pkgname}.py
  install -Dm755 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}.py
  install -Dm644 wunderground.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
}
