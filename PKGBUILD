# Maintainer: excalibur1234 @forum.manjaro.org

pkgname=pacli-simple-git
pkgver=1.2
pkgrel=1
pkgdesc="A simple and interative Bash Frontend for Pacman/Yaourt"
arch=(any)
url="https://github.com/excalibur1234/$pkgname"
license=('GPL3')
depends=('yaourt'
        'pacman-mirrorlist'
        'downgrade'
        'fzf')
makedepends=('git')
optdepends=('update-notifier: Automatically get notified when updates are available')
conflicts=('pacli')
provides=("pacli")
source=("git://github.com/excalibur1234/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
        install -Dm755 "$srcdir/$pkgname/pacli" "$pkgdir/usr/bin/pacli"
}
