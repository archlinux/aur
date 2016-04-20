#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=synclinks
pkgver=2016.4.20
pkgrel=1
pkgdesc='A tool that synchronizes hierarchies of symlinks.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/synclinks"
depends=(glibc)
source=(
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2016.4.20.tar.xz
  http://xyne.archlinux.ca/projects/synclinks/src/synclinks-2016.4.20.tar.xz.sig
)
sha512sums=(
  551a6e150e01b89af1d0ad135dbadc0fe33d7636aef2239cb140910d7bead7fc963832428bf34422abac0646f4029584816fa7d319a7faaec84930783ff24d33
  a6b590b07c5feee42a5672ebb52b427a0bab3b4117320932443a53cb7a0c52f95a78099ccee5c790db37f89cb3f9774ba72808bddb602887889aea587fafa69d
)
md5sums=(
  d8180834e8b5b6dd81a51deab2251910
  1549e04d0b97ba36eb9689892ad175b1
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
