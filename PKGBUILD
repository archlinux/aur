#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=alsaequal-mgr
pkgver=2013.7.10
pkgrel=4
pkgdesc='Save and restore named alsaequal states.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/alsaequal-mgr"
depends=(alsaequal bash-statemgr)
source=(
  https://xyne.dev/projects/alsaequal-mgr/src/alsaequal-mgr-2013.7.10.tar.xz
  https://xyne.dev/projects/alsaequal-mgr/src/alsaequal-mgr-2013.7.10.tar.xz.sig
)
sha512sums=(
  b87035598dda0049ffd21e41ae84dc2f5ea54f8e8b109bb535b1489e9bbf44072e67c24af25135f1537156f08e18f238c2c6dfb13dac88e46ce17a61d5abba72
  b51fe0e1dd5417425b72989095fe00536deba93bd051595493704c8fde252748c52090530ad7a92edd8d65c2208cdafca83bd04617f220207a935c4dc9f026aa
)
md5sums=(
  75f6760860eb8be4f3538f6d5feed771
  eb11afe180704c7a4440740f98edd5c3
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
