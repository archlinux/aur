pkgname=touchpadfix
pkgver=1.0.0
pkgrel=1
pkgdesk="This script will instantly restore touchpad functionality if it has frozen and is not responding to touch."
arch=('any')
url="https://archlinux.org"
license=('MIT')
depends=('bash')
source=('touchpadfix.sh')
sha256sums=('SKIP')

package() {
	install -d "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/touchpadfix.sh" "${pkgdir}/usr/bin/${pkgname}"
}
