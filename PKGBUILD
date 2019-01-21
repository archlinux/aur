# Maintainer: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-plymouth-one
pkgver=1.0.1.4
pkgrel=0
pkgdesc="TUXEDO style plymouth theme"
arch=('any')
url="https://github.com/tuxedocomputers/tuxedo-plymouth-one"
license=('GPLv2')
depends=('plymouth')
makedepends=('')
source=(git+https://github.com/tuxedocomputers/tuxedo-plymouth-one)
install=
md5sums=('SKIP')

package() {
  echo -e "\033[31m\033[1m\033[4mYou must had to add plymouth to HOOKS in /etc/mkinitcpio.conf\033[0m"
  echo -e "\033[31m\033[1m\033[4mFor more Informations see: https://wiki.archlinux.org/index.php/plymouth\033[0m"
  cd /usr/share/plymouth/themes/
  sudo git clone https://github.com/tuxedocomputers/tuxedo-plymouth-one.git tuxedo-one
  sudo plymouth-set-default-theme -R tuxedo-one
}
