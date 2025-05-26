# Maintainer: mos9527 <greats3an@gmail.com>
pkgname=bt-synckeys
pkgver=0.0.1            
pkgrel=1
pkgdesc="Automated Windows to Linux Bluetooth Key syncing script for dual-booting people"
arch=('any')
url="https://github.com/mos9527/bt-synckeys/"
license=('MIT')
depends=('python' 'chntpw')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bt-synckeys.py "${pkgdir}/usr/bin/${pkgname}"  
}
