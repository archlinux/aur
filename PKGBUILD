# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
_pkgname=digital-strip
pkgname=ttf-$_pkgname
pkgver=1.0
pkgrel=1
pkgdesc="Font for digital comic strips."
arch=(any)
url="https://blambot.com/"
license=('custom')
_license=("https://www.wfonts.com/tos")
source=("https://www.wfonts.com/download/data/2016/06/01/${_pkgname}/${_pkgname}.zip")
md5sums=('f2af6524ec97bb8ff9b4f251d0a0eac8')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
