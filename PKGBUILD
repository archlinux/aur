# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=pomodoro
pkgver=2
pkgrel=1
pkgdesc="Time tool."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("https://github.com/samuellando/pomodoro/archive/$pkgver.tar.gz")
sha256sums=('8541729b91acd0522c61d7bd66f22b7b4b58ce3925f11bb61f9fc0aa36c5c9db')

package() {
  rm -r ${srcdir}/$pkgname-$pkgver/pomodoro.info.def
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname-$pkgver/* ${pkgdir}/usr/bin/
}
