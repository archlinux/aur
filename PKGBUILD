# Maintainer: Leo von Klenze <aur@leo.von-klenze.de>
pkgname=jquery
pkgver=2.1.3
pkgrel=1
pkgdesc="jQuery is a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development."
arch=(i686 x86_64)
url="http://jquery.com"
license=('MIT' 'GPL2')

source=(http://code.jquery.com/jquery-$pkgver.min.js)
md5sums=('32015dd42e9582a80a84736f5d9a44d7')

package() {
    mkdir -p $pkgdir/usr/share/jquery
    cd $srcdir
    cp jquery-$pkgver.min.js $pkgdir/usr/share/jquery
    ln -s /usr/share/jquery/jquery-$pkgver.min.js $pkgdir/usr/share/jquery/jquery.min.js
}

