# Maintainer: James An <james@jamesan.ca>

_pkgname=wpa_supplicant-wext
pkgname="$_pkgname-systemd"
pkgver=1
pkgrel=1
pkgdesc="Systemd service unit config file for wpa_supplicant using the wext driver"
arch=('any')
url="https://github.com/jamesan/aur-pkgs/tree/master/wpa_supplicant-wext-systemd"
license=('GPL')
depends=('wpa_supplicant')
source=("$_pkgname@.service")
md5sums=('cad19025451735b9216109fb20cea79e')

package() {
    install -Dm644 "$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}
