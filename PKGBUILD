# Maintainer: mynacol <paul àt dismail _ de>

pkgname=theme-switcher-git
pkgver=0.4
pkgrel=1
pkgdesc="Switching between light and dark themes made easy"
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}/"
license=('GPL')
depends=('sh'  # script interpreter
	'glib2'  # provides gsettings
	'grep'  # regex matching in conditionals
)
makedepends=('coreutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dark-theme.sh')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm755 dark-theme.sh "$pkgdir/usr/bin/${pkgname%-git}"
}
