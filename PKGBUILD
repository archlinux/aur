#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=alatools
pkgver=2017.5
pkgrel=1
pkgdesc='Tools for the Arch Linux Archive.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/alatools"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/alatools/src/alatools-2017.5.tar.xz
  http://xyne.archlinux.ca/projects/alatools/src/alatools-2017.5.tar.xz.sig
)
sha512sums=(
  87453ff07f1d087d1f9fc9055b01ab86ab538437af49274f73b7765698353006391660861874b5b940993b46642c8eac3c7698c6dd373803afe8c47445452a83
  e03c59ab4eb0da65cb1acfeaed349dd625b8be6bdb058e3fc936d6410038a795002fc537b6b2e7ee4d6842a3e0d501a36b662b4b23376c1b6650e323f12f1a90
)
md5sums=(
  e28503bc4640f27b5b930af54f2d22b5
  691790704ce2f22e9bba5927b04f2352
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  for script_ in "$srcdir/$pkgname-$pkgver/exe/"*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
