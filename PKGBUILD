#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3.5.2
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.5.2.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.5.2.tar.xz.sig
)
sha512sums=(
  bce3a30bc3f3882ef457042e669d84e03067c2eec824491469d9769bac433c1c8a69cec3c2302b3fe60acf4e334879855c829e176c50da1cb818f2404a917135
  c6c50fdaa278253a788638407b4e689133e219d36a9da9741a5a7822826f868fafa39156a81db6af23876af7b16b80b651a3ebc4a1ed7f7cdc68ba01d5158653
)
md5sums=(
  7763c21d8532849f74159ad8f7bf467d
  3136357e0bb18b84ddc4de635c0e8faa
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
