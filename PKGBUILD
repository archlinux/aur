# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=dbus-action
pkgver=1.1
pkgrel=1
pkgdesc="Watch D-Bus to action configured commands on specific events"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6" "gtk3" "python-gobject" "python-dbus"
"python-ruamel-yaml")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('bdc1f215f186149db81e1d420e753996')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
