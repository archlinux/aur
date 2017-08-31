# Maintainer: excalibur1234 @forum.manjaro.org

_pkgname=pacui
pkgname=$_pkgname-git
pkgver=1.6.1
pkgrel=2
pkgdesc="Bash script providing advanced Pacman and Pacaur/Yaourt functionality in a simple UI"
arch=(any)
url="https://github.com/excalibur1234/pacui"
license=('GPL3')
depends=('expac' 'wget' 'sudo' 'fzf')
makedepends=('git')
conflicts=("$_pkgname" 'pacli-simple-git')
replaces=('pacli-simple-git')
optdepends=('pacaur: Needed for AUR support. If installed, it gets used by default over Yaourt.'
        'yaourt: Needed for AUR support.'
        'pacman-mirrors: Needed for Manjaro mirror support'
        'reflector: Needed for Arch Linux mirror support'
        'downgrade: Needed for hidden "downgrade" option.')
source=("$_pkgname::git+https://github.com/excalibur1234/$_pkgname.git")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$_pkgname/pacui" "$pkgdir/usr/bin/pacui"
}
