#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.tar.xz.sig
)
sha512sums=(
  fabf06cc4ba6aa2a1adc67b1ef21b5669d8032e6cece7b5876cee81a423a076dd4d0bb794e62a5cd9a9f7637ff86f090d004ae1c30c2462cf8bbb3feac4d336d
  7b5d7b8e162629bd14044e5f869b2a0e801bb4e40ae5a5cb741f3cf899870669d75b7133177953aec0de3645bfd1f481e4b16d982a6db52a5d147c99406158e7
)
md5sums=(
  f365a62af5143c1a9eeba2007104e620
  2c684f88a7c79fefe1ed7cf34270402b
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
