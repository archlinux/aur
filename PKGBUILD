# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=4
pkgrel=1
pkgdesc="Time tool."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("https://github.com/samuellando/pomodoro/archive/$pkgver.tar.gz")
sha256sums=('4f8c0d82c11714fe198d5dd2182264f860d500d8b6ff4a8e3dab12fd45f4dc37')

package() {
  rm -r ${srcdir}/$pkgname-$pkgver/pomodoro.info.def
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname-$pkgver/* ${pkgdir}/usr/bin/
}
