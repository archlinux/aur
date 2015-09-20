# Maintainer: Scott R. Santos <halocaridina at gmail.com>

pkgname=xvisbell
pkgver=1.0
pkgrel=0
pkgdesc="Visual bell for X11"
arch=('any')
license=('GPL2')
url="https://github.com/halocaridina/xvisbell"
depends=('libx11')
makedepends=('git' 'make')
source=("git+https://github.com/halocaridina/xvisbell.git#commit=fe9230033b11e3c1b29b07a4fa85856b4b03cc5c")
md5sums=('SKIP')

build() {
  cd xvisbell

  make
}

package() {
  cd xvisbell

  cp xvisbell /usr/bin/xvisbell
}
