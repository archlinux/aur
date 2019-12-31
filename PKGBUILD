# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=xod
pkgver=v0.32.1
pkgrel=1
pkgdesc="XOD is a visual programming language for microcontrollers."
arch=('any')
url="https://xod.io/"
license=('AGPL3')
depends=('nodejs' 'yarn')
conflicts=('xod-git')
source=("https://www.googleapis.com/download/storage/v1/b/releases.xod.io/o/v0.32.1%2Fxod-client-electron-0.32.1.x86_64.rpm?generation=1575652852526433&alt=media")
md5sums=('ce40b5f343012541f5d5f9d88de21776fc09990a932e045b984c32c5524c14a8')
options=('!strip')

package() {
  cd ${srcdir}
  cp -r opt usr ${pkgdir}
  install -D -m644 LICENSES.chromium.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
