# Maintainer: Felix Springer <felixspringer149@gmail.com>

pkgname=blugon
pkgdesc="A blue light filter written in 'python' using 'xorg-xgamma' as backend"
pkgver=0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/jumper149/blugon"
license=('Apache')
depends=('python')
optdepends=('xorg-xgamma: backend')
source=('git+https://github.com/jumper149/blugon.git')
_gitname="blugon"
sha256sums=('SKIP')

package() {
  cd "$_gitname"
  install -Dm755 blugon "$pkgdir/usr/bin/blugon"
}
