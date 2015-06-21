#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=armh
pkgver=2013.5.22.1
pkgrel=1
pkgdesc='Pacman history parser and helper script for the Arch Rollback Machine (ARM).'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/armh"
depends=(python3 pyalpm)
source=(
  http://xyne.archlinux.ca/projects/armh/src/armh-2013.5.22.1.tar.xz
  http://xyne.archlinux.ca/projects/armh/src/armh-2013.5.22.1.tar.xz.sig
)
sha512sums=(
  1a4de77c305d7764291fc2663bd3887714933f44cd26b6d59015ba8d14bad184356331b42a47f0347b0eb350377f1aa7bb6b643ead95185550db2e2a582b878d
  1340e02cd54de1676eb55f2f0ebe1500952451c193c3fdf629e26464ca46c775b36b5da1cb51641890cf863680a83adf01ccff9665cbe61243dcfbb651dfba78
)
md5sums=(
  531a453d07568c73c467c0c55e87eeb6
  65e1643faa37a2fa0195d704a98bed2c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
