# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='batificator'
pkgver='v1.0'
pkgrel=1
pkgdesc='A battery status notifier'
arch=('any')
url="https://gitlab.com/JustMeErazem/${pkgname}"
license=('MIT')
depends=('libnotify' 'xpub')
optdepends=('notification-daemon')
source=("https://gitlab.com/JustMeErazem/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm644 "${pkgname}.rules" "${pkgdir}/etc/udev/rules.d/${pkgname}.rules"
}
