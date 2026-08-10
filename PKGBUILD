#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgname="mpvcut"
pkgver=0.7
pkgrel=0
pkgdesc='Turns mpv into a video cutter.'
url='https://codeberg.org/tuxnix/mpvcut'
arch=('any')
license=('GLPv2-only')
depends=('mpv' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/mpvcut')
sha512sums=('SKIP')


package() {
    cd "$srcdir/$pkgname"
    install -Dm644 main.lua "$pkgdir/etc/skel/.config/mpv/scripts/mpvcut/main.lua"
    install -Dm644 config.lua "$pkgdir/etc/skel/.config/mpv/scripts/mpvcut/config.lua"
    install -Dm605 ffpid "$pkgdir/usr/local/bin/ffpid"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
