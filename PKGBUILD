#
# Maintainer: Drew Chapin <druciferre@gmail.com>
#
pkgname=nautilus-emblems-menu-extension-git
pkgver=r13.62041a2
pkgrel=1
pkgdesc="This is a simple Nautilus extension which adds a context menu to files and directories which lets you set/modify emblems its emblems."
arch=('any')
url="https://github.com/allefant/Nautilus-Emblems-Menu-Extension"
license=('Public Domain')
depends=('python2-nautilus' 'nautilus')
optdepends=()
makedepends=('git' 'python2-nautilus')
conflicts=()
backup=()
source=('git+https://github.com/allefant/Nautilus-Emblems-Menu-Extension.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd Nautilus-Emblems-Menu-Extension
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd Nautilus-Emblems-Menu-Extension
	install -Dm644 nautilus_emblems_menu.py "$pkgdir/usr/share/nautilus-python/extensions/nautilus_emblems_menu.py"
}
