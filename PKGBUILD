# Maintainer: mynacol <paul àt dismail _ de>

pkgname=theme-switcher-git
pkgver=0.4.3
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
sha256sums=('e1997a841c3a82f77d97be531db38615f92ea392b5572eb2d811b7081a3c5f79')

package() {
	cd "$srcdir"
	install -Dm755 dark-theme.sh "$pkgdir/usr/bin/${pkgname%-git}"
}
