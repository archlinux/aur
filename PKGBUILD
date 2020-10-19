# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=powertop-auto-tune
pkgver=2020.10
pkgrel=1
pkgdesc='A systemd service for powertop that sets all tunable options to their GOOD setting.'
arch=('any')
url="https://wiki.archlinux.org/index.php/Powertop"
license=('FDL')
depends=("systemd" "powertop")
_unit='powertop.service'
source=($_unit)
sha256sums=('9bec6ad11930ba315588970a032ecd05dd580af9ce903de6f787800445357304')

package() {
	install -Dpm 0644 $_unit "$pkgdir/usr/lib/systemd/system/$_unit"
}
