#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=lsgrp
pkgver=2013.2
pkgrel=5
pkgdesc='A simple command-line utility to list all members of a group.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/lsgrp"
source=(
  https://xyne.dev/projects/lsgrp/src/lsgrp-2013.2.tar.xz
  https://xyne.dev/projects/lsgrp/src/lsgrp-2013.2.tar.xz.sig
)
sha512sums=(
  6c2236fe1d290c0fc616cb912a2c461eb3b3ad4b8a423cb955d993da11a235b9e9a8e0bbcdb5981b203106ad3548afe927856446e66c3f5fafa4a98f35a554af
  51b53d9f3678e8a352fb94dba5f640bbff389f48364e47efdec63e9da8f33f5d2f81afe27bf5053ae19f79ea7572a926a1ac3973f70880ecc107fc1f07c36701
)
md5sums=(
  2250c4688c3d36d7fe4c54f32b56104d
  3b50165cbb8b0626f35c17bcdb241498
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

build ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make
}

package ()
{
  cd -- "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
