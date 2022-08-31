# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ninja-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="Small build system with a focus on speed"
arch=('x86_64')
url="https://ninja-build.org/"
license=('apache')
depends=('gcc-libs')
provides=("ninja=$pkgver")
conflicts=('ninja')
source_x86_64=("https://github.com/ninja-build/ninja/releases/download/v$pkgver/ninja-linux.zip")
sha256sums_x86_64=('b901ba96e486dce377f9a070ed4ef3f79deb45f4ffe2938f8e7ddc69cfb3df77')


package() {
  install -Dm755 "ninja" -t "$pkgdir/usr/bin"
}
