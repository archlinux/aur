# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=powertop-auto-tune
pkgver=2021.9
pkgrel=2
pkgdesc='A systemd service for powertop that sets all tunable options to their GOOD setting.'
arch=('any')
url="https://wiki.archlinux.org/index.php/Powertop"
license=('FDL')
depends=("systemd" "powertop")
_unit='powertop.service'
source=($_unit)
sha256sums=('6c8f5d252c5924e3fb589b787423be693e0c5cb8c99f2da1aedd29c0ab8ce976')
install="${pkgname}.install"

package() {
	install -Dpm 0644 $_unit "$pkgdir/usr/lib/systemd/system/$_unit"
}
