# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.6
pkgrel=1
pkgdesc="Enable doers to edit non-user-editable files with an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bfe0af402b1f2df447a3cecb3027a9176f8de0bbe8f09be9f59a15fcd58e22bf')

package() {
	cd doasedit
	install -Dm 755 doasedit -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
