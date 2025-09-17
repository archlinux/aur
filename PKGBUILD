#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>


pkgrel=2
pkgver=1.7
_name="tvb-recorder"
pkgname="$_name"
pkgdesc='record and switch for tvbrowser'
url='https://codeberg.org/tuxnix/tv-recorder'
arch=('any')
license=('GLPv2-only')
depends=('tvbrowser' 'mpv' 'at' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/tv-recorder')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$_name"
    install -Dm744 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm744 tvb-switch "$pkgdir/usr/local/bin/tvb-switch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
