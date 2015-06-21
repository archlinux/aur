#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=alsaequal-mgr
pkgver=2013.7.10
pkgrel=1
pkgdesc='Save and restore named alsaequal states.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/alsaequal-mgr"
depends=(alsaequal bash-statemgr)
source=(
  http://xyne.archlinux.ca/projects/alsaequal-mgr/src/alsaequal-mgr-2013.7.10.tar.xz
  http://xyne.archlinux.ca/projects/alsaequal-mgr/src/alsaequal-mgr-2013.7.10.tar.xz.sig
)
sha512sums=(
  b87035598dda0049ffd21e41ae84dc2f5ea54f8e8b109bb535b1489e9bbf44072e67c24af25135f1537156f08e18f238c2c6dfb13dac88e46ce17a61d5abba72
  9659f0ff40d56bb5c91802faf8921fb745c6b22ac775bd9674d6506f2adcc2d48a336b6efac61acfe650fe29a330e31ebdedd8c4667168a3339cb906f5710f6d
)
md5sums=(
  75f6760860eb8be4f3538f6d5feed771
  744c08164074de8e5be71ecb71d2ed47
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
