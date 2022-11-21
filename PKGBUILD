# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.4
pkgrel=1
pkgdesc="Enable doers to edit non-user-editable files with an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('76536e787c52732351d3eefc7ecbd62389782e1b4947c8c030c8f4c55c56818a')

package() {
	cd doasedit
	install -Dm 755 doasedit -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
