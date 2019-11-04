# Maintainer: Jonathon Fernyhough <jonathon+at+manjaro dotorg>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-gtk-theme
pkgver=2.6.7
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='https://github.com/numixproject/numix-gtk-theme'
license=('GPL3')
makedepends=('gdk-pixbuf2' 'glib2' 'libxml2' 'ruby-sass')
optdepends=('gtk-engine-murrine: for gtk2 theme')
replaces=('numix-themes')
_commit='2e58680a210ccfd050b2a713c29f013fc34ab311'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2b997ad3eee0b802d0dd49dd772127fd3c337cca32d8863efd4897928e38879a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
