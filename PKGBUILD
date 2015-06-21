#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ottools
pkgver=2013.3
pkgrel=1
pkgdesc='Tools for encrypting files with one-time pads.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ottools"
replaces=(otsplit)
conflicts=(otsplit)
provides=(otsplit)
source=(
  http://xyne.archlinux.ca/projects/ottools/src/ottools-2013.3.tar.xz
  http://xyne.archlinux.ca/projects/ottools/src/ottools-2013.3.tar.xz.sig
)
sha512sums=(
  cdbce6f96072ed6bca9aaceb7198bb4a455be9e72e657cbe6965b23890178a0f32059fba22d3975a9ec52db44fab2feb134fef6326189118c04773ae366c6ab0
  73d6e3bebea0faac3eab7f99a1c6ba09e4c174d54f29f0b3fb1693d073dfd6bcac1f9d0a6bfcfa5ff8229c26e6ee03b5a69caa0a6f7f55044ec745c02f9757dd
)
md5sums=(
  c338e362d2603424f753819c2ac84c16
  497a16050e0759bb6b432633db9074ee
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
