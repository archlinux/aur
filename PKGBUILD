# Maintainer: samsapti <sam at sapti dot me>
# Contributor: Ultracoolguy <dummyd241 at gmaildotcom>
# Quick thanks to deuill, creator of rofi-dmenu
pkgname=opendoas-sudo
pkgver=1
pkgrel=1
pkgdesc="A symlink for using Doas as a drop-in replacement for sudo"
arch=('any')
url="https://github.com/Duncaen/OpenDoas"
license=('MIT')
depends=('opendoas')
provides=('sudo')
conflicts=('sudo')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which doas) "$pkgdir"/usr/bin/sudo
}
