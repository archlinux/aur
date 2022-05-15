# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ninja-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Small build system with a focus on speed"
arch=('x86_64')
url="https://ninja-build.org/"
license=('apache')
depends=('gcc-libs')
provides=("ninja=$pkgver")
conflicts=('ninja')
source_x86_64=("https://github.com/ninja-build/ninja/releases/download/v$pkgver/ninja-linux.zip")
sha256sums_x86_64=('9726e730d5b8599f82654dc80265e64a10a8a817552c34153361ed0c017f9f02')


package() {
  install -Dm755 "ninja" -t "$pkgdir/usr/bin"
}
