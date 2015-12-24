# Maintainer: MadTux <andreasgwilt@gmail.com>
pkgname=minetest-lott
pkgver=1.0.0
pkgrel=1
pkgdesc="A Lord of the Rings-based game for the Minetest engine."
url="http://minetest.ig42.org/"
arch=('any')
license=('LGPL2')
depends=('minetest')
conflicts=('minetest-lott-git')
source=("https://github.com/minetest-LOTT/Lord-of-the-Test/archive/v${pkgver}.tar.gz")
md5sums=('f51902cd6f165cf9cdf7a7e7330eef1a')

package() {
  cd "${srcdir}/Lord-of-the-Test-${pkgver}"
  mkdir -p "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
  cp -r * "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
}

# vim:set ts=2 sw=2 et:
