pkgname=teamviewer-runit
pkgalias=teamviewerd
_realname=teamviewer-runit
pkgdesc="Teamviewer, runit init scripts"
pkgver=1.0
pkgrel=1
pkgbase=teamviewer-runit
replaces=('teamviewer-runit')
arch=('any')
url="https://aur.archlinux.org/packages/teamviewer-runit"
license=('BSD3')
groups=()
depends=('runit-rc' 'teamviewer')
optdepends=('clamav-unofficial-sigs')
source=('teamviewerd.run'
	    'teamviewerd.install')
sha256sums=('9cf6ee391fb83edbcf48b2bcb0a6303125836bafc8af4f109fa38722e737bd45'
			'5f9dbeeae033ab4dbf5569c7fe8c1171c5caa4a8927fca004b0bf7c7ff1697cb')

package() {
	install -Dm755 teamviewerd.run "$pkgdir"/etc/runit/sv/teamviewer/run
	install=teamviewerd.install
}
