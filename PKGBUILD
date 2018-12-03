# Maintainer: lynix <lynix47@gmail.com>

pkgname=checkrun.sh-git
pkgver=20181203
pkgrel=1
pkgdesc="Cron-style mailing wrapper for systemd .timer units"
url="https://github.com/lynix/checkrun.sh"
arch=('any')
license=('MIT')
depends=('bash')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/lynix/checkrun.sh.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
