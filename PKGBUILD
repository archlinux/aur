#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2020.4.24.1
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.4.24.1.tar.xz
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.4.24.1.tar.xz.sig
)
sha512sums=(
  21f970e8bae040fa9f175f6768653def5173c2af2f135f7f470776711afcb54d8284d8a901f54b909986f5f0648d73245c99934fd5bc1c83728af73bd3e2b9ef
  286627096d434c535bc41c1bba87dcd76c87e40e42589931596db9519192365d0f9f0fdece074c974e1b5c261a281bb8dffefad8c03afc6d8b1620a33b62b3d7
)
md5sums=(
  c1511a09ca9635b0b93470ff12905c11
  5d17ad49289a122b8290256f6846aa41
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
