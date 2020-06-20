# Maintainer: foo bar
# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
pkgname=opendoas-sudo
pkgver=1
pkgrel=1
pkgdesc="A symlink for using Doas as a drop-in replacement to sudo, heavily copy-pasted from rofi-dmenu"
arch=('any')
url="https://davedavenport.github.io/rofi/"
license=('MIT')
depends=('opendoas')
provides=('sudo')
conflicts=('sudo')

package() {
  install -d "$pkgdir"/usr/bin
  ln -s $(which doas) "$pkgdir"/usr/bin/sudo
}
