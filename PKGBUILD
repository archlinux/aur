#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2013
pkgrel=2
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/synclinks"
source=(
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2013.tar.xz
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2013.tar.xz.sig
)
sha512sums=(
  23a4a29d56354af17401f213fc20f33577535af59c25952de5702771b55755a2a2c2c5db85af9934b11cae37090074fb591ac988dd0b44348700aba39e6e336d
  d1d2c9d8c8bd6964905bf059db191210b6ab4261e2dc78319988c8ee7fbb7f68ad3204afe2df4979b1f6c7f1512d8fa5de7f2885bba371abcd1618d19b1212a1
)
md5sums=(
  db03da0db54e061954563abdacb6790f
  ad935987e8064d88be17eb6360e6a419
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
