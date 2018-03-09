# Maintainer: Rastislav Barlik <barlik.arch at gmx dot com>
pkgname=urxvt-vtwheel-vte
pkgver=1.0
pkgrel=1
pkgdesc="VTE-like scroll wheel support for urxvt"
arch=('any')
url="http://aur.archlinux.org/"
license=('unknown')
depends=('rxvt-unicode-cvs')
source=('vtwheel')
md5sums=('6c4802c76fb22f92285f875fdb0d7bad')

package() {
        install -Dm0664 "$srcdir/vtwheel" "$pkgdir/usr/lib/urxvt/perl/vtwheel"
}
