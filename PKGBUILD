# Maintainer: Luc <iq2luc at gmail dot com>
pkgname=waveengine
pkgver=2.0.6
pkgrel=1
pkgdesc="WaveEngine - Component based game engine"
arch=('i686' 'x86_64')
url="https://waveengine.net/"
license=('custom')
depends=(mono openal sox sdl)
makedepends=(dpkg)
_debfile="WaveEngineSetup_${pkgver//\./_}.deb"
source=("https://wave.blob.core.windows.net/waveinstallers/$_debfile")
md5sums=('1145e1c69a8782676cf8654efc6931d5')

package() {
  dpkg --extract $_debfile $pkgdir
}
