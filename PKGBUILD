#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=tiv
pkgver=2015
pkgrel=1
pkgdesc='A simple image viewer that displays images directly in the terminal.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/tiv"
depends=(imagemagick perl)
optdepends=('jp2a: ascii character output')
source=(
  http://xyne.archlinux.ca/projects/tiv/src/tiv-2015.tar.xz
  http://xyne.archlinux.ca/projects/tiv/src/tiv-2015.tar.xz.sig
)
sha512sums=(
  58efc74fb20221c1b69dc0589bbbd827bbdf900300284221a32a71b0cf39971d37b427edf94eb23a533c9ada9cf72fc58e72e45bef420195e181eda27dafa7c6
  70c555a885f7dd49d426b6d5057f358e2bb6e7f0268b7c4dafa028baf2c053b83ad8f24f0ce33116398cdb52a6f3840a04da0143331fbd149eb40ecd30c8f19f
)
md5sums=(
  c875dba27bfc2cdc702c108922d9bf59
  82df5736bce27c4612affa0b3470824e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
