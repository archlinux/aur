#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2020.4.23
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.4.23.tar.xz
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.4.23.tar.xz.sig
)
sha512sums=(
  391cb5cdf8f056986a980af96c6c90cd06cdd58f6509d6c7c14d57acd1c5ca8a0beb4a57247a36921f6490b92bdf47df5e909abd64d6b72a08658bba8e035fa8
  d730a226152133c86f274531808d977c8add8b3b36a6f28649aa641eebc81d59e2989ac5df1d0ffbb87bc4eb060362196f52f8e6f81ddfe1e8289be6884985c0
)
md5sums=(
  f00af0c95eae4e4460580ccf3954c033
  bf7dccbaa3719b5438880d92ec30ef9b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
