#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

_name="mpvcut"
pkgver=0.5
pkgrel=1
pkgname="$_name"
pkgdesc='A lua script mpv becomes a video cutter'
url='https://codeberg.org/tuxnix/mpvcut'
arch=('any')
license=('GLPv2-only')
depends=('mpv' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/mpvcut')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$_name"
    install -Dm644 mpvcut.lua "$pkgdir/usr/share/mpv/scripts/mpvcut/mpvcut.lua"
    install -Dm644 mpvcut.conf "$pkgdir/usr/share/mpv/scripts/mpvcut/mpvcut.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
