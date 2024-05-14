# Maintainer: Jeka <evgeny.myandin[at]gmail[dot]com>
pkgname=bdprochot-bin
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Simple BDPROCHOT disabler"
arch=(x86_64)
url="https://github.com/myandin/bdprochot/"
license=('GPL2')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/myandin/bdprochot/releases/download/v${pkgver}/bdprochot.tar.gz"
         "bdprochot.service")
noextract=()
md5sums=('fc7dcb3e62b461f65574f152fa5833fa'
         '32c1bb7899190a345e8a78945be5d46e')
validpgpkeys=()

package() {
  install -Dm755 "./bdprochot" "${pkgdir}/usr/local/bin/bdprochot"
  install -Dm644 "./bdprochot.service" "${pkgdir}/usr/lib/systemd/system/bdprochot.service"
}
