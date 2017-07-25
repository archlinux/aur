# Maintainer: dwroland @gmail.com
pkgname=ntrig_fix
pkgver=0.1
pkgrel=1
pkgdesc="systemd script to fix ntrig touchscreen after wake from "
arch=(any)
url="https://github.com/dwroland/$pkgname"
license=('GPL')
depends=('systemd')
makedepends=('git')
source=("git://github.com/dwroland/$pkgname")
md5sums=('SKIP')

package() {
  cd "$srcdir"
  install -Dm500 "$srcdir/$pkgname/ntrig_fix.sh" "$pkgdir/usr/lib/systemd/system-sleep/ntrig_fix.sh"
}
