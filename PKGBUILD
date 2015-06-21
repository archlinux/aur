#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=lsgrp
pkgver=2013.2
pkgrel=2
pkgdesc='A simple command-line utility to list all members of a group.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/lsgrp"
source=(
  http://xyne.archlinux.ca/projects/lsgrp/src/lsgrp-2013.2.tar.xz
  http://xyne.archlinux.ca/projects/lsgrp/src/lsgrp-2013.2.tar.xz.sig
)
sha512sums=(
  6c2236fe1d290c0fc616cb912a2c461eb3b3ad4b8a423cb955d993da11a235b9e9a8e0bbcdb5981b203106ad3548afe927856446e66c3f5fafa4a98f35a554af
  f13ccfecbbfada3e69ee3a686a74b880918203296b962a0a4318d8cefa3c6aaeaef4cdbc104f74674e7fee2b5f0551933337bbec13aae8432f4c8f6029f6b945
)
md5sums=(
  2250c4688c3d36d7fe4c54f32b56104d
  7d9dc969887d174d100d32baf5b449ae
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

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
