#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=facadefs
pkgver=2012.12.24.1
pkgrel=5
pkgdesc='A FUSE-based filesystem sandbox.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/facadefs"
depends=(python2 python2-fuse)
source=(
  https://xyne.dev/projects/facadefs/src/facadefs-2012.12.24.1.tar.xz
  https://xyne.dev/projects/facadefs/src/facadefs-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  f9c1b3288b3173d5c853af98935f5856dedfba96e1c4ff301e9f77e75ce44956bd95463dfbc34f528f45ad5ac2013c80673119e38a2b653bcf6a6bd2f9ae354a
  bb1eda1a4f4e60cee3e3d3b973654e48682f8bcd8b9b9996652572c3d089a069cef7a3d5be0eb809614523b4c726c6a5c5a89a316a2b8673564c70f670b200c6
)
md5sums=(
  72e9f7e3445047d7b433f9d922b62597
  aed06424c28e0383e88c5fe2089dabdf
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
