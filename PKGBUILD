# Maintainer: Thiago Avelino <thiago@avelino.xxx>

pkgname=aur
_pkgver_maj=0.1
pkgver=0.1.2
pkgrel=1
pkgdesc='ArchLinux Package Manager helper'
arch=('x86_64')
license=('MIT')
url='https://github.com/avelino/aur'
depends=('curl' 'pacman')
options=('!emptydirs')

package() {
  cd ${pkgdir}
  sudo curl -L "https://raw.githubusercontent.com/avelino/aur/master/aur" -o /usr/local/bin/aur
  sudo chmod +x /usr/local/bin/aur
}
