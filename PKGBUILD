# Maintainer: Scott R. Santos <halocaridina at gmail.com>

pkgname=xvisbell
pkgver=1.0
pkgrel=0
pkgdesc="Visual bell for X11"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/halocaridina/xvisbell"
depends=('libx11')
makedepends=('git' 'make')
source=("git+https://github.com/halocaridina/xvisbell.git#commit=b230ba8c96c4118efe45f59da3119368a1a1c537")
md5sums=('SKIP')

build() {
  cd xvisbell

  make
}

package() {
  cd xvisbell

  make PREFIX="$pkgdir/usr" install
}
