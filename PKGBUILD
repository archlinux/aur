# Maintainer: shadichy <shadichy.dev@gmail.com>

pkgname='ibus-daemon-de'
pkgver='0.0.1'
pkgrel='1'
pkgdesc='SystemD user service for IBus'
arch=('any')
license=('MIT')
url='https://github.com/shadichy/ibus-daemon.git'
depends=(
	'systemd'
	'ibus'
	'bash'
)
source=(
	'enable-ibus-daemon'
	'LICENSE.md'
)
sha512sums=(
	'SKIP'
	'SKIP'
)

package() {
	cd "$srcdir"
	install -Dm755 enable-ibus-daemon "$pkgdir/usr/bin/enable-ibus-daemon"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
