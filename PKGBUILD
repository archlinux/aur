#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=facadefs
pkgver=2012.12.24.1
pkgrel=2
pkgdesc='A FUSE-based filesystem sandbox.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/facadefs"
depends=(python2 python2-fuse)
source=(
  http://xyne.archlinux.ca/projects/facadefs/src/facadefs-2012.12.24.1.tar.xz
  http://xyne.archlinux.ca/projects/facadefs/src/facadefs-2012.12.24.1.tar.xz.sig
)
sha512sums=(
  f9c1b3288b3173d5c853af98935f5856dedfba96e1c4ff301e9f77e75ce44956bd95463dfbc34f528f45ad5ac2013c80673119e38a2b653bcf6a6bd2f9ae354a
  1e60e7d80c81ffe6d44ba97a6b2b69864921c4f5f40bdce1398e1db1393c479e85623a708956a38d2147c010bf81efe7d3e72c46bcb6750541acd92105e78f3d
)
md5sums=(
  72e9f7e3445047d7b433f9d922b62597
  dd1bf693b38d851b3e2664b9b4517a50
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}


# vim: set ts=2 sw=2 et:
