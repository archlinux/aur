pkgname=eim-gui-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="ESP-IDF installation manager"
arch=('x86_64' 'aarch64')
url="https://github.com/espressif/idf-im-ui"
license=('Apache-2.0')
provides=('eim-gui')
conflicts=('eim-gui')
depends=('ccache' 'dfu-util')
makedepends=('unzip')
options=('!strip')

source_aarch64=("https://github.com/espressif/idf-im-ui/releases/download/v${pkgver}/eim-gui-linux-aarch64.zip")
source_x86_64=("https://github.com/espressif/idf-im-ui/releases/download/v${pkgver}/eim-gui-linux-x64.zip")

sha256sums_aarch64=("831914842148f782ca6d17f58d50da62b2e49c0293c4c4d2bb7a352f28b7193c")
sha256sums_x86_64=("ed0f7fee0f12659d8f655d91fdab419ef2842f4424ef70e156563554f12652f4")

package() {
  install -Dm755 "eim" "${pkgdir}/usr/bin/eim-gui"
}
