#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2020
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.tar.xz
  https://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2020.tar.xz.sig
)
sha512sums=(
  ee346829079fe9850fcac4059dc31ee653782d3ca2f5f48c0f4963ee2f5f03a3af70865a8fbea527586fa4293d053dc3a7849584fd3dec888837e65d5c61d0cb
  9e57c6f68bad28cdb594f96f5945aa6948f97216f57ae5b603a7e82907e5c7ec2f08960dd0980a30f3a1c20362b34c4a3537013d8e56252297fd812b6eef99ad
)
md5sums=(
  7548133d54f47cb9120c72086d8021ad
  fd5171661fc985847fd0075c38e1a795
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
