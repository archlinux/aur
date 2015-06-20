# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer : Zoe <chp321@gmail.com>

pkgname=packup
pkgver=3.e8af569
pkgrel=4
pkgdesc="A simple Pacman backup and restore script."
arch=('any')
url="https://github.com/ghost1227/packup"
license=('GPL')
makedepends=('git')
depends=('dialog')
source=(git://github.com/ghost1227/packup)
md5sums=('SKIP')


pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
} 
