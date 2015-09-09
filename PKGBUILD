# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: http://qpm.io
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/Cutehacks/qpm

pkgrel=1
pkgname='qpm-bin'
pkgver='v0.10.0'
pkgdesc='Qt Package Manager'
arch=('x86_64' 'i686')
url='http://qpm.io'
provides=('qpm')
conflicts=('qpm-git' 'qpm')
license=('LGPL')
source=("https://www.qpm.io/download/v0.10.0/linux_386/qpm")
sha256sums=('fa5a485a287c3fc6ed8aadc6a4eed31f0d197df45d88bda1691029d020c01f6c')

package() {
  local installdir=${pkgdir}/usr/bin

  mkdir -p ${installdir}
  cd ${installdir}

  mv ${startdir}/qpm ${installdir}
}
