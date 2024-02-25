# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=xod
pkgver=v0.38.0
pkgrel=1
pkgdesc="XOD is a visual programming language for microcontrollers."
arch=('any')
url="https://xod.io/"
license=('AGPL3')
depends=('nodejs' 'yarn')
conflicts=('xod-git')
source=("https://www.googleapis.com/download/storage/v1/b/releases.xod.io/o/v0.38.0%2Fxod-client-electron-0.38.0.x86_64.rpm?generation=1615553616000093&alt=media")
sha256sums=('68e8263c08fe3806fdc7f3a46e45d9e94d2863479433c9e4a4a28dbcae224aed')
options=('!strip')

package() {
  cd ${srcdir}
  cp -r opt usr ${pkgdir}
  install -D -m644 opt/'XOD IDE'/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}