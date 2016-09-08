# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=netflix
pkgver=1.0
pkgrel=1
pkgdesc="Watch Netflix and stream it to chromecast."
arch=('i686' 'x86_64')
url=""
license=('MIT')
depends=('google-chrome')
source=("$pkgname.png"
        "$pkgname.desktop")
md5sums=('56ced67fc54f8dbc53977f9262eb8736'
         '2fded08652e2b3e1d837f838e7936f4a')

package() {
    install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
# vim:set ft=sh:
