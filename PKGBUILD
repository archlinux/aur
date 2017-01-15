# Maintainer: excalibur1234 @forum.manjaro.org

pkgname=pacli-simple-git
pkgver=1.2
pkgrel=3
pkgdesc="A simple and interative Bash Frontend for Pacman/Yaourt"
arch=(any)
url="https://github.com/excalibur1234/pacli-simple"
license=('GPL3')
depends=('yaourt'
        'pacman-mirrorlist'
        'downgrade'
        'fzf')
makedepends=('git')
optdepends=('update-notifier: Automatically get notified when updates are available')
conflicts=('pacli')
provides=("pacli")
source=("git://github.com/excalibur1234/pacli-simple")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/pacli-simple/pacli" "$pkgdir/usr/bin/pacli"
}
