# Maintainer: dadav <33197631+dadav@users.noreply.github.com>

pkgname=rofi-tmpmail-git
pkgver=0.1.0
pkgrel=1
pkgdesc="This tool if a rofi wrapper for the tmpmail tool"
arch=('x86_64')
url="https://github.com/dadav/rofi-tmpmail"
license=('GPL')
makedepends=()
provides=('rofi-tmpmail')
source=("https://github.com/dadav/rofi-tmpmail/archive/${pkgver}.zip")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/rofi-tmpmail-${pkgver}"
  install -D -m0755 rofi-tmpmail.sh ${pkgdir}/usr/bin/rofi-tmpmail
}
