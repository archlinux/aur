# Maintainer: Peter Babič <babicpet at gmail dot com>
pkgname=mtnm
pkgver=2012.05.23
pkgrel=1
pkgdesc="Moves window to next monitor / screen"
arch=(any)
url="http://icyrock.com/blog/2012/05/xubuntu-moving-windows-between-monitors/"
license=('unknown')
groups=()
depends=('xdotool' 'wmctrl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('mtnm')
noextract=()
md5sums=('c64f49268124746d83eb634aa6b9bbd0')

package() {
    install -Dm755 "$srcdir"/mtnm "$pkgdir"/usr/bin/mtnm
}
