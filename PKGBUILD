# Maintainer: WaffleFrisbee <dev@longfam.org>
pkgname=lemurs-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC script for lemurs a TUI Display/Login Manager"
arch=('x86_64')
url="https://aur.archlinuc.org/lemurs-openrc"
license=('custom:WTFPL')
depends=('lemurs')
optdepends=('openrc: to make use of the OpenRC initscripts.')
source=(
	'lemursd.initd'
	'LICENSE'
)
sha256sums=(SKIP)

package() {
	install -Dm755 ${srcdir}/lemursd.initd "$pkgdir"/etc/init.d/lemursd
	install=lemursd.install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
