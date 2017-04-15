# Maintainer: Luc <iq2luc at gmail dot com>
pkgname=waveengine
pkgver=2.3.1
pkgrel=0
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl sdl_mixer)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
sha256sums=('767afb214c4914070768d0a3ee851f11665ff50bdce9e9c7db29f884ad895ac0')

package() {
  dpkg --extract $_debfile $pkgdir
}

