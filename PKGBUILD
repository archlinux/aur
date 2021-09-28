# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=powertop-auto-tune
pkgver=2021.9
pkgrel=1
pkgdesc='A systemd service for powertop that sets all tunable options to their GOOD setting.'
arch=('any')
url="https://wiki.archlinux.org/index.php/Powertop"
license=('FDL')
depends=("systemd" "powertop")
_unit='powertop.service'
source=($_unit)
sha256sums=('0f56e8475519e84eff5740e44fb9e8cd27cefb65746053436a1a0d5610dd2305')
install="${pkgname}.install"

package() {
	install -Dpm 0644 $_unit "$pkgdir/usr/lib/systemd/system/$_unit"
}
