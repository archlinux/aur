# Maintainer: David Manouchehri
# Contributor: Doug Richardson <dougie.richardson@gmail.com>

pkgname=disable-resolved-llmnr
pkgver=1.0.0
pkgrel=1
pkgdesc="Disable Link Local Multicast Name Resolution (LLMNR)."
arch=('any')
url="https://github.com/drichardson/arch_packages"
license=('BSD')
depends=('systemd')
install='disable-llmnr.install'
source=('disable-llmnr.conf')
sha512sums=('774e08792428b8aec4c07e0f73d9b99eff17f8805eb99ff016062c567ec3c7ea253d3dca15f483977b451ceccec13fe142e573284e605c769e28b3196599a92a')

package() {
	install -Dm644 "${srcdir}/disable-llmnr.conf" "${pkgdir}/etc/systemd/resolved.conf.d/disable-llmnr.conf"
}
