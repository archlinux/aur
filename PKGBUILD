# Maintainer: Aakash Sen Sharma <aakashsensharma@gmail.com>
pkgname=wayshot-bin
_pkgname=wayshot
pkgver=1.2.2
pkgrel=2
pkgdesc="A screenshot tool for wlroots compositors."
url="https://github.com/waycrate/wayshot"
license=('BSD')
arch=('x86_64')
optdepends=('slurp: for area selection')
makedepends=('scdoc' 'rust')
provides=('wayshot-bin')
conflicts=('wayshot-git' 'wayshot-musl-git')
source=("$_pkgname-bin::$url/releases/download/$pkgver/$_pkgname"
		"$_pkgname-src::git+https://git.sr.ht/~shinyzenith/$_pkgname"
		)
sha256sums=('SKIP'
			'SKIP'
			)

package() {
	install -Dm 755 $_pkgname-bin "$pkgdir/usr/bin/$_pkgname"
}
