#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=cups-client-mgr
pkgver=2013
pkgrel=1
pkgdesc='Save and restore CUPS client states.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/cups-client-mgr"
depends=(bash-statemgr)
source=(
  http://xyne.archlinux.ca/projects/cups-client-mgr/src/cups-client-mgr-2013.tar.xz
  http://xyne.archlinux.ca/projects/cups-client-mgr/src/cups-client-mgr-2013.tar.xz.sig
)
sha512sums=(
  d90de376a27bce254f2130d92f334fa8f983e315f62d06e86d936c9579c6b776ac980d2ae75a310c244bcd9660732a1c272b2b577db30fbd4286b8b0c1fa8e9a
  e34effefb628aa5129c3fe7d31dbca04dcc2b01d5543e4193cda56a672fa20d1823449ca36222f29b900a819295def51e088b3f78ac0b637ae697a7984f4efe1
)
md5sums=(
  519dec6d2c2962fa94837085bbaa34c1
  7dd5ca58e3db803368fcbb0a227cda13
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
