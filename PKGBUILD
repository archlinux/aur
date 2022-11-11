# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.1
pkgrel=1
pkgdesc="Enable doers to edit non-user-editable files with an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('76ba40c2dff360bfd6981af8ad9ec936b165a0265576f4ec09635808bb0d11f6')

package() {
	cd doasedit
	install -Dm 755 doasedit -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
