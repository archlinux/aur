# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL')
provides=('picsimlab')
depends=('wxgtk3' 'picsim' 'openal')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/v${pkgver}/picsimlab_${pkgver}_unbuntu_20.04_amd64.deb/download")
sha256sums=('6a94b4b66eaedf672292eac5c3b9c5f91810e0c49707e03a28c859f6643f86d7')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}