# Maintainer: Luc <iq2luc at gmail dot com>
pkgname=waveengine
pkgver=2.3.0
pkgrel=0
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl sdl_mixer)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
md5sums=('aecb2ab42f8214358c0e534af78eb9ac')

package() {
  dpkg --extract $_debfile $pkgdir
}

