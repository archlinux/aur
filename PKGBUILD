# Maintainer: MadTux <andreasgwilt@gmail.com>
pkgname=minetest-lott
pkgver=1.2.4
pkgrel=1
pkgdesc="A Lord of the Rings-based game for the Minetest engine."
url="https://minetest-lotr.github.io/"
arch=('any')
license=('LGPL2')
depends=('minetest')
conflicts=('minetest-lott-git')
source=("https://github.com/minetest-LOTR/Lord-of-the-Test/archive/v${pkgver}.tar.gz")
md5sums=('34a30ca84abbf0b8e0ee23eabb69023f')

package() {
  cd "${srcdir}/Lord-of-the-Test-${pkgver}"
  mkdir -p "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
  cp -r * "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
}

# vim:set ts=2 sw=2 et:
