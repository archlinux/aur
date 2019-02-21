# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=waveengine
pkgver=2.5.0
pkgrel=0
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl sdl_mixer gtk-sharp-2)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
sha256sums=('b105ff703805ac2b92d5b9dff87e415f123940fb39bb6b1c8a14cc440f2dafeb')

package() {
  dpkg --extract $_debfile $pkgdir
}

