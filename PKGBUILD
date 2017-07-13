# Maintainer: lynix <lynix47@gmail.com>

pkgname=hdd-spindown.sh-git
pkgver=20170713
pkgrel=1
pkgdesc="Automatic Disk Standby using Kernel diskstats and hdparm"
url="https://github.com/lynix/hdd-spindown.sh"
arch=('any')
license=('MIT')
depends=('coreutils' 'grep' 'systemd' 'hdparm')
optdepends=('smartmontools: recognizing SMART self-tests' \
            'iputils: host monitoring feature' \
            'util-linux: logging to syslog')
makedepends=()
conflicts=()
replaces=()
backup=('etc/hdd-spindown.rc')
source=("git://github.com/lynix/hdd-spindown.sh.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
