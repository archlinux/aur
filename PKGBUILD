# Maintainer: Luc <iq2luc at gmail dot com>
pkgname=waveengine
pkgver=2.2.0
pkgrel=1
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl sdl_mixer)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
md5sums=('eca4679fd8e43ba9da1983a0201bc859')

package() {
  dpkg --extract $_debfile $pkgdir
}

