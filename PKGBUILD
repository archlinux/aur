# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Leo von Klenze <aur@leo.von-klenze.de>

pkgname=jquery
pkgver=2.1.4
pkgrel=1
pkgdesc="Cross-platform JavaScript library designed to simplify the client-side scripting of HTML"
arch=('any')
url="http://jquery.com"
license=('MIT' 'GPL2')

source=(http://code.jquery.com/jquery-$pkgver.min.js)
sha256sums=('f16ab224bb962910558715c82f58c10c3ed20f153ddfaa199029f141b5b0255c')

package() {
    mkdir -p $pkgdir/usr/share/jquery
    cd $srcdir
    cp jquery-$pkgver.min.js $pkgdir/usr/share/jquery
    ln -s /usr/share/jquery/jquery-$pkgver.min.js $pkgdir/usr/share/jquery/jquery.min.js
}
