# Maintainer: excalibur1234 @forum.manjaro.org

_pkgname=pacui
pkgname=$_pkgname-git
pkgver=1.3
pkgrel=2
pkgdesc="A simple and interative Bash Frontend for Pacman/Pacaur/Yaourt"
arch=(any)
url="https://github.com/excalibur1234/pacui"
license=('GPL3')
depends=('pacman-mirrorlist' 'package-query' 'fzf')
makedepends=('git')
provides=('$_pkgname')
conflicts=('$_pkgname')
replaces=('pacli-simple-git')
optdepends=('pacaur: Needed for AUR support. If installed, it gets used by default over Yaourt.'
        'yaourt: Needed for AUR support.'
        'downgrade: Needed for hidded "downgrade" option.'
        'update-notifier: Automatically get notified when updates are available.')
source=("$_pkgname::git+https://github.com/excalibur1234/$_pkgname.git")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$_pkgname/pacui" "$pkgdir/usr/bin/pacui"
}
