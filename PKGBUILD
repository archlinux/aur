# Contributor: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
pkgname=gtk-theme-moomex
pkgver=0.7.1
pkgrel=1
pkgdesc="A GTK 2.0 + Metacity Theme: Moomex"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Moomex-Theme?content=57063"
license=('GPL')
depends=('gtk2')
source=(http://gnome-look.org/CONTENT/content-files/57063-Moomex.tar.gz)
md5sums=('d2f5a560079168e6be351d85be5b52b3')

build() {
  cd "$srcdir"

  install -d -m755 "${pkgdir}/usr/share/themes/Moomex"
  cp -r Moomex "${pkgdir}/usr/share/themes"
}
