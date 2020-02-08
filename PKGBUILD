# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=3
pkgrel=1
pkgdesc="Time tool."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("https://github.com/samuellando/pomodoro/archive/$pkgver.tar.gz")
sha256sums=('0560126fa5ae9837444cf2ca207b84088b5ac5bd69f273d91c85cf59a6336154')

package() {
  rm -r ${srcdir}/$pkgname-$pkgver/pomodoro.info.def
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname-$pkgver/* ${pkgdir}/usr/bin/
}
