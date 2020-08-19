# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ninja-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Small build system with a focus on speed"
arch=('x86_64')
url="https://ninja-build.org/"
license=('apache')
depends=('gcc-libs')
provides=('ninja')
conflicts=('ninja')
source=("https://github.com/ninja-build/ninja/releases/download/v$pkgver/ninja-linux.zip")
sha256sums=('7ee7f467a1a747c5b5e02342904af9c24e84df4ca993541f1c4d0f113cab27aa')


package() {
  install -Dm755 "ninja" -t "$pkgdir/usr/bin"
}
