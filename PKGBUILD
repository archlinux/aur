# Maintainer: Nikita Bobko <nikitabobko (at) gmail (dot) com>

pkgname=java-gnome-bin
pkgver=4.1.3
pkgrel=1
pkgdesc='Binaries of Java bindings to the GNOME platform (including gtk, glib and glade)'
arch=('x86_64')
url='https://github.com/nikitabobko/${pkgname}'
license=('GPL')
depends=('java-runtime<9' 'gtksourceview3' 'librsvg' 'libnotify' 'enchant' 'gtkspell3')
conflicts=("java-gnome")
source=("https://github.com/nikitabobko/${pkgname}/releases/download/v${pkgver//_/-}/${pkgname}-v${pkgver//_/-}.tar")
sha256sums=("e173bbec8bc2640cf8e137c851a747fb23fab0a2657b6da06ae4e3e76eeafaea")

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}
    cp -r --no-dereference * ${pkgdir}
}
