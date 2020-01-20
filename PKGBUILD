# Maintainer: soredake  <fdsfgs@krutt.org>

pkgname=mpv-webm-git
_pkgname=mpv-webm
pkgver=r1
pkgrel=1
pkgdesc="Simple WebM maker for mpv, with no external dependencies."
arch=('any')
url="https://github.com/ekisu/mpv-webm"
depends=('mpv')
source=('git+https://github.com/ekisu/mpv-webm')
md5sums=('SKIP')

package () {
    install -Dm644 "$srcdir/$_pkgname/build/webm.lua" "$pkgdir/usr/share/mpv/scripts/webm.lua"
}
