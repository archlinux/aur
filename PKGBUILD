pkgdesc="A GUI for Modem-Manager. Build from source with patches."
url='https://linuxonly.ru/page/modem-manager-gui/'

pkgname='modem-manager-gui-git'
pkgver='0.0.20'
arch=('x86_64')
pkgrel=1
license=('GPL3')

conflicts=(modem-manager-gui)
provides=(modem-manager-gui)

makedepends=(
        mercurial
)

source=("hg+http://hg.code.sf.net/p/modem-manager-gui/code modem-manager-gui-code")

sha256sums=('SKIP')

pkgver() {
  cd modem-manager-gui-code
  git describe --tags | sed 's/-rc/rc/;s/-/+/g'
}



