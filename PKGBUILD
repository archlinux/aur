# Contributor: Sagittarius A* <lux.r.ck@gmail.com>
# Maintainer: Asuka Minato

pkgname=rgssad-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Extract rgssad/rgss2a/rgss3a files."
arch=('x86_64')
url="https://github.com/luxrck/rgssad"
license=('MIT')
depends=(glibc gcc-libs)
makedepends=()
conflicts=(rgssad)
provides=(rgssad)
source=("https://github.com/luxrck/rgssad/releases/download/0.1.4/rgssad-linux-x64")
md5sums=('dd3db861fef94e81bd71069be0e5d5f5')


package() {
  install -Dm755 rgssad* $pkgdir/usr/bin/rgssad
}

# vim:set ts=2 sw=2 et:

