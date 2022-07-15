#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=ottools
pkgver=2013.3
pkgrel=4
pkgdesc='Tools for encrypting files with one-time pads.'
arch=(i686 x86_64)
license=(GPL)
url="https://xyne.dev/projects/ottools"
replaces=(otsplit)
conflicts=(otsplit)
provides=(otsplit)
source=(
  https://xyne.dev/projects/ottools/src/ottools-2013.3.tar.xz
  https://xyne.dev/projects/ottools/src/ottools-2013.3.tar.xz.sig
)
sha512sums=(
  cdbce6f96072ed6bca9aaceb7198bb4a455be9e72e657cbe6965b23890178a0f32059fba22d3975a9ec52db44fab2feb134fef6326189118c04773ae366c6ab0
  3caeddbac4fc8a2536d8450689dbcd5acfe48eb12d595524100e29fe166bb807a33e7048cd04fbad86714cef54e195cba38f468bd932833948e09bf32b05f170
)
md5sums=(
  c338e362d2603424f753819c2ac84c16
  a50772f0b96d993258f4037e82154eb4
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
