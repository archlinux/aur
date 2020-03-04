# Maintainer: jmattheis <contact AT jmattheis DOT de>
pkgname=gruvbox-dark-icons-gtk
pkgver=1.0.0
pkgrel=1
options=(!strip)
pkgdesc='Gruvbox dark icon theme'
optdepends=('gruvbox-dark-gtk: matching gtk theme.')
arch=('any')
url="https://github.com/jmattheis/gruvbox-dark-icons-gtk"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmattheis/gruvbox-dark-icons-gtk/archive/v$pkgver.tar.gz")
sha256sums=('777d1defdb7a6d9977e1cf417dfbe297b5861bc81ceaa7772cef4fff1362813d')

package() {
    mkdir -p "$pkgdir/usr/share/icons/$pkgname"
    cd "$srcdir/$pkgname-$pkgver"
    rm README.md
    cp -r * "$pkgdir/usr/share/icons/$pkgname"
    chown -R root:root "$pkgdir/usr/share/icons"
    chmod -R ugo+rX "$pkgdir/usr/share/icons"
}

