# Maintainer: lynix <lynix47@gmail.com>

pkgname=hdd-spindown.sh-git
pkgver=20150524
pkgrel=1
pkgdesc="Automatic Disk Standby using Kernel diskstats and hdparm"
url="https://github.com/lynix/hdd-spindown.sh"
arch=('any')
license=('MIT')
depends=('awk' 'coreutils' 'grep' 'systemd' 'hdparm' 'util-linux')
optdepends=('smartmontools: recognizing SMART self-tests')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/lynix/hdd-spindown.sh.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname%-git}"
  make PREFIX="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
