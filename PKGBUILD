# Maintainer: Andy Kluger <AndyKluger@gmail.com>
pkgname=acbuild
pkgver=0.1.1
pkgrel=1
pkgdesc="Command line utility to build and modify App Container Images (ACIs), the container image format defined in the App Container (appc) spec implemented by rkt."
arch=('i686' 'x86_64')
url="https://github.com/appc/acbuild"
license=('Apache')
depends=('gnupg')
makedepends=('git')
source=("git+https://github.com/appc/acbuild.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  ./build
}

package() {
  cd "$pkgname"
  install -D ./bin/acbuild "$pkgdir/usr/bin/acbuild" 
}

# vim:set ts=2 sw=2 et:
