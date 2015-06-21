#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=serman
pkgver=2014.7
pkgrel=1
pkgdesc='Dialog-based systemd service management.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/serman"
depends=(python3 dialog)
source=(
  http://xyne.archlinux.ca/projects/serman/src/serman-2014.7.tar.xz
  http://xyne.archlinux.ca/projects/serman/src/serman-2014.7.tar.xz.sig
)
sha512sums=(
  6dffaf460ad34379739cc9659e7fc8048c640c9b673e7e5143b6a792d27cb54cf39162e7fb6ea5e7915c24eb8fcee52252a90390659f91b5a14047976a7f4817
  074b1f70f68dff17707b94760e37561973db7fbb75bf105c9757dcb32b66709952459b299faad534d947fe78b6950534a93cf429336830347fb4113f261359cb
)
md5sums=(
  6cad6217042d139abf7bd3cf9263f6c1
  7b1ae0a4fb7ac0da1235538f66ed0cb8
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/${pkgname}2" "$pkgdir/usr/bin/${pkgname}2"
}


# vim: set ts=2 sw=2 et:
