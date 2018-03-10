# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Luc <iq2luc at gmail dot com>
pkgname=waveengine
pkgver=2.4.1
pkgrel=0
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl sdl_mixer gtk-sharp-2)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
sha256sums=('6c9e743c3d8349781e014db5ea85a19ff67f24efa252191b5f46b8524127eb91')

package() {
  dpkg --extract $_debfile $pkgdir
}

