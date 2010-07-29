# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

pkgname=lib32-giflib
pkgver=4.1.6
pkgrel=3
pkgdesc="A library for reading and writing gif images"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('lib32-libx11' 'lib32-libsm')
options=()
source=(ftp://ftp.archlinux.org/core/os/i686/giflib-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
md5sums=('7125644155ae6ad33dbc9fc15a14735f')

build() {
  mkdir -p $pkgdir/opt/lib32/usr/lib/
  cp -R $srcdir/usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
}

# vim: sw=2:ts=2
