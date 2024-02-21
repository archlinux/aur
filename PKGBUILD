# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=pacman-cleanup
pkgver=1.0.0
pkgrel=1
pkgdesc="A small cli tool to delete packages"
arch=('x86_64')
url="https://dev.acosom.com/linux/arch/pacman-cleanup"
license=('MIT')
depends=('libnewt')
source=("https://dev.acosom.com/~downloads/projects/84/archives?revision=v${pkgver}&format=zip")
md5sums=('44d677e7cacfdcc5eac7b16fcf2226f2')

package() {
  install -D "$srcdir/pacman-cleanup" "$pkgdir/usr/bin/pacman-cleanup"
}
