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
source=("${pkgname}::git+${url}#commit=a7ca2f1cd2b62d497ff688e48fdeb013438b9c69")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bt-synckeys.py "${pkgdir}/usr/bin/${pkgname}"  
}
