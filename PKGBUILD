# Maintainer: excalibur1234 @forum.manjaro.org

pkgname=pacui-git
pkgver=1.3
pkgrel=1
pkgdesc="A simple and interative Bash Frontend for Pacman/Pacaur/Yaourt"
arch=(any)
url="https://github.com/excalibur1234/pacui"
license=('GPL3')
depends=('pacman-mirrorlist'
        'package-query'
        'fzf')
makedepends=('git')
optdepends=('pacaur: Needed for AUR support. If installed, it gets used by default over Yaourt.'
        'yaourt: Needed for AUR support.'
        'downgrade: Needed for hidded "downgrade" option.'
        'update-notifier: Automatically get notified when updates are available.')
source=("git+https://github.com/excalibur1234/pacui")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/pacui/pacui" "$pkgdir/usr/bin/pacui"
}
