#Maintainer: Kartoffel <laar@tutanota.com>
pkgname=bible_gui
pkgver=0.1.3
pkgrel=1
arch=('any')
pkgdesc='A GTK bible app for desktop and mobile.'
url='https://github.com/Lugsole/net.lugsole.bible_gui'
license=('MIT')
depends=('python-gobject' 'libblockdev' 'espeak-ng' 'xapp' 'libgexiv2' )
makedepends=('meson' 'git' 'python3')
source=($pkgname::git+https://github.com/Lugsole/net.lugsole.bible_gui.git#branch=master)
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  meson build --prefix /usr/
  cd build
  meson install --destdir $pkgdir
}
