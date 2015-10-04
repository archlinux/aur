# Maintainer: Chrysostomus @forum.manjaro.org
pkgname=delayed-hibernation
pkgver=0.1
pkgrel=1
pkgdesc="systemd hook to hibernate suspended system after a delay"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=("MIT")
depends=('systemd')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
  cd "$srcdir"
  install -Dm755 "$srcdir/$pkgname/suspend-to-hibernate.service" "$pkgdir/etc/systemd/system/suspend-to-hibernate.service"
}
