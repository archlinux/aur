#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.tar.xz.sig
)
sha512sums=(
  4a8f3fe86a821a363a4fea0d456b37e1f53a05af236c84421f377ae6d423c130ca19aea3ea943d77ae72b01a8e3f79ddfdd0f04a3b130d72383ae8b1b90eb099
  ba142562ff425deddb83597137190208b344496edbefcc64d9cbb51bef28777a405518236414dfdfc3a0397abd17090e8a793e34646078d86c7d9c489ff34897
)
md5sums=(
  16d457683d9728b36bcbf0952f709136
  8bb8df6a3c5d42724397a9d10a8d6788
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
