# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

pkgrel=1
pkgname='qpm-bin'
pkgver='v0.11.0'
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
provides=('qpm')
conflicts=('qpm')
license=('LGPL')
source=("https://www.qpm.io/download/${pkgver}/linux_386/qpm")
sha256sums=('d6ad272a5c251c33a8c5fa96906cf66084b2b6eb33abc5589de87c4dddececaa')

package() {
  local installdir=${pkgdir}/usr/bin

  cd ${srcdir}/../
  chmod +x qpm
  mkdir -p ${installdir}
  mv qpm ${installdir}
}
