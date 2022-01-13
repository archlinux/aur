# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

# Modified from opendoas-sudo
# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
# Quick thanks from deuill, creator of rofi-dmenu
_depends=wget2
_provides=wget
pkgname=$_depends-$_provides
pkgver=1
pkgrel=1
pkgdesc="A symlink for using $_depends as a drop-in replacement to $_provides"
arch=('any')
url="https://gitlab.com/gnuwget/wget2"
license=('GPL3')
depends=($_depends)
provides=($_provides)
conflicts=($_provides)

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which $_depends) "$pkgdir"/usr/bin/$_provides
}
