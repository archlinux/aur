# Maintainer: BigBoiMan123 <gandshuang@gmail.com>
pkgname=odysseyra1n
pkgver=1.0
pkgrel=1
pkgdesc="Bootstraps Procursus and install Sileo/libhooker on devices jailbroken with checkra1n. "
arch=('x86_64')
url="https://github.com/coolstar/odyssey-bootstrap"
license=('unknown')
depends=('openssh' 'libimobiledevice' 'libirecovery' 'curl' 'checkra1n-cli')
makedepends=('coreutils')
source=("https://raw.githubusercontent.com/coolstar/Odyssey-bootstrap/master/procursus-deploy-linux-macos.sh")
md5sums=(SKIP)

package() {
  mkdir -p ${pkgdir}/usr/bin

  install -m 0755 procursus-deploy-linux-macos.sh ${pkgdir}/usr/bin/odysseyra1n
}
