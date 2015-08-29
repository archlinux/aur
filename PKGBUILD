# Maintainer: Lauri Niskanen <ape@ape3000.com> 
# Contribytor: Arkham <arkham at archlinux dot us> 
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>

pkgname=gtk-theme-shiki-colors
pkgver=4.6
pkgrel=1
pkgdesc="Shiki-Colors GTK+ and Metacity theme"
arch=('i686' 'x86_64')
url="http://gnome-colors.googlecode.com/"
license=('GPL')
depends=('gtk-engines')
optdepends=('gnome-colors-icon-theme: Icon themes which well suited to shiki-colors')
source=(http://gnome-colors.googlecode.com/files/shiki-colors-${pkgver}.tar.gz)
md5sums=('b0e5e6d20132ae46a3114ee357f9ec24')

package() {
    cd "${srcdir}"
    make DESTDIR="${pkgdir}" install 
}
