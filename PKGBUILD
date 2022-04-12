# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.1
pkgrel=1
pkgdesc="Enable doers to edit non-user-writable files with an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f25d41c8874b149f71ca3519325b35d0f7fb1679040aeace741b62c2ac7195b8')

package() {
	cd doasedit
	install -Dm 755 doasedit -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
