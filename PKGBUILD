# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL')
provides=('picsimlab')
depends=('wxgtk3' 'picsim' 'openal')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/v${pkgver}/picsimlab_${pkgver}_unbuntu_20.04_amd64.deb/download")
sha256sums=('7b137612a1814e012b6a447bef4dbf8eda5837f0275ee89b00a96cd5913e8f6d')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
