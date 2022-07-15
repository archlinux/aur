#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=serman
pkgver=2014.7
pkgrel=4
pkgdesc='Dialog-based systemd service management.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/serman"
depends=(dialog python3)
source=(
  https://xyne.dev/projects/serman/src/serman-2014.7.tar.xz
  https://xyne.dev/projects/serman/src/serman-2014.7.tar.xz.sig
)
sha512sums=(
  6dffaf460ad34379739cc9659e7fc8048c640c9b673e7e5143b6a792d27cb54cf39162e7fb6ea5e7915c24eb8fcee52252a90390659f91b5a14047976a7f4817
  babc9e54b005a2053e23f2e1ee18db85b648c13257e612a47e0e51d2f41cf4bc04a933f0bdc576bb966ec55ad6b9abcc157d358279a24efa022657ae74176ff0
)
md5sums=(
  6cad6217042d139abf7bd3cf9263f6c1
  078c7e1d4ade212f9f56afd22f48a8e2
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/${pkgname}2" "$pkgdir/usr/bin/${pkgname}2"
}


# vim: set ts=2 sw=2 et:
