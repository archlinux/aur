# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer : Zoe <chp321@gmail.com>

pkgname=packup
pkgver=0.4
pkgrel=3
pkgdesc="A simple Pacman backup and restore script."
arch=('any')
url="https://github.com/ghost1227/packup"
license=('GPL')
makedepends=('git')
optdepends=('yay')
depends=('dialog')
source=("https://codeload.github.com/evertiro/$pkgname/zip/refs/heads/master")
md5sums=('25e36155d5b76ea6e042cf07e65ad039')

package() {
  cd ${srcdir}/${pkgname}-master

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
} 
