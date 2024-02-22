# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dynstr
pkgver=0.1.0
pkgrel=5
pkgdesc="Minimal library that provides dynamic strings using plain C99"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/dynstr"
license=('Apache')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('92047c0db21d5320b1b496f90ddf34a4fd487604a9ac4a7fce52a1cb31f3c930124fe48a1af5dde918dc4fc1cf9624d2b99886287b2ae3b2ce6002546b0e718a')

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make prefix="$pkgdir/usr" install  
}

