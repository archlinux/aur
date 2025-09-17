#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>


pkgrel=1
pkgver=1.7
_name="tvb-recorder"
pkgname="$_name"
pkgdesc='recording and switch for tvbrowser'
url='https://codeberg.org/tuxnix/streamrecorder'
arch=('any')
license=('GLPv2-only')
depends=('tvbrowser' 'mvp' 'at' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/streamrecorder')
sha512sums=('SKIP')

package() {
    cd "$srcdir/$_name"
    install -Dm744 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm744 switch "$pkgdir/usr/local/bin/switch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
