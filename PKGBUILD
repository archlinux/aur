# Maintainer: excalibur1234 @forum.manjaro.org

_pkgname=pacui
pkgname=$_pkgname-git
pkgver=1.5
pkgrel=1
pkgdesc="A simple and interative Bash Frontend for Pacman/Pacaur/Yaourt"
arch=(any)
url="https://github.com/excalibur1234/pacui"
license=('GPL3')
depends=('package-query' 'wget' 'gawk' 'sudo' 'fzf')
makedepends=('git')
conflicts=("$_pkgname" 'pacli-simple-git')
replaces=('pacli-simple-git')
optdepends=('pacaur: Needed for AUR support. If installed, it gets used by default over Yaourt.'
        'yaourt: Needed for AUR support.'
        'downgrade: Needed for hidded "downgrade" option.')
source=("$_pkgname::git+https://github.com/excalibur1234/$_pkgname.git")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$_pkgname/pacui" "$pkgdir/usr/bin/pacui"
}
