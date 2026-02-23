#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgname="mpvcut"
pkgver=0.5
pkgrel=1
pkgdesc='A lua script mpv becomes a video cutter'
url='https://codeberg.org/tuxnix/mpvcut'
arch=('any')
license=('GLPv2-only')
depends=('mpv' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/mpvcut')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 main.lua "$pkgdir/usr/share/mpv/scripts/mpvcut/main.lua"
    install -Dm644 mpvcut.config "$pkgdir/usr/share/mpv/scripts/mpvcut/mpvcut.config"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
