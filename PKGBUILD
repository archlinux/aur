# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.2
pkgrel=1
pkgdesc="Enable doers to edit non-user-editable files with an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('937cb52a45bf370d089e9feaba78d1e2a861bffcbfbf0bcc7bf9be617262673b')

package() {
	cd doasedit
	install -Dm 755 doasedit -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
