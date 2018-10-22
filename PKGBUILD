# Maintainer: Guilhem Saurel <guilhem@saurel.me>

pkgname=xcursor-gruppled-lite
pkgver=1
pkgrel=1
pkgdesc='gruppler X11 cursor theme, made entirely in Inkscape, inspired by Ghost Cursors and Curo.'
arch=('any')
license=('GPL2')
source=('https://www.bde.enseeiht.fr/~saurelg/gruppled_lite_cursors_by_gruppler.zip')
md5sums=('e85d435e16808d58211cd7407b7456ee')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r \
        "$srcdir/gruppled_black_lite" \
        "$srcdir/gruppled_white_lite" \
        "$pkgdir/usr/share/icons"
}
