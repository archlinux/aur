# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=java-gnome-bin
pkgver=4.1.3
pkgrel=4
pkgdesc='Binaries of Java bindings to the GNOME platform (including gtk, glib and glade)'
arch=('x86_64')
url='https://github.com/nikitabobko/java-gnome-bin'
license=('GPL')
depends=('gtksourceview3')
conflicts=("java-gnome")
source=("https://github.com/nikitabobko/${pkgname}/releases/download/v${pkgver//_/-}-3/${pkgname}-v${pkgver//_/-}-3.tar")
sha256sums=("905cafabd03a1f1b07e85e13d8fc56c77ac8f9d25ce2fc02b71eedcc1f220ac9")

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}-3
    cp -r --no-dereference * ${pkgdir}
}
