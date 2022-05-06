# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ninja-bin
pkgver=1.10.2
pkgrel=3
pkgdesc="Small build system with a focus on speed"
arch=('x86_64')
url="https://ninja-build.org/"
license=('apache')
depends=('gcc-libs')
provides=("ninja=$pkgver")
conflicts=('ninja')
source_x86_64=("https://github.com/ninja-build/ninja/releases/download/v$pkgver/ninja-linux.zip")
sha256sums_x86_64=('763464859c7ef2ea3a0a10f4df40d2025d3bb9438fcb1228404640410c0ec22d')


package() {
  install -Dm755 "ninja" -t "$pkgdir/usr/bin"
}
