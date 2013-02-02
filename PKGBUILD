# Maintainer: Ner0

pkgname=gtk-theme-config
pkgver=0.5
pkgrel=1
pkgdesc="A tool to configure GTK theme colors."
arch=('i686' 'x86_64')
url="https://github.com/satya164/gtk-theme-config"
license=('GPL3')
depends=('cairo' 'glib2' 'gtk3')
makedepends=('vala')
conflicts=('gtk-theme-config-git' 'gtk-theme-preferences-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/satya164/gtk-theme-config/tarball/v$pkgver")
md5sums=('b73e03fee770ceffa5a141ab22eefa43')

package() {
  cd satya164-*

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
