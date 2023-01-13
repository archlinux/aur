# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmon-dev64-git
pkgver=1
pkgrel=1
pkgdesc="SysMon, a system monitor aiming to be fast and ready to use."
arch=('any')
url="https://github.com/devlocalhost/sysmon"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('nvidia-utils: NVIDIA GPU utilization and clock speed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'sysmon-git' 'sysmon')
source=('git+https://github.com/devlocalhost/sysmon.git')
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "$srcdir/sysmon/sysmon" "$pkgdir/usr/bin/sysmon"
  chmod +x "$pkgdir/usr/bin/sysmon"
}
