# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=f4transkript
pkgver=7.0.6
pkgrel=1
pkgdesc="Speeds up your transcription process"
arch=('x86_64')
url="www.audiotranskription.de"
license=('')
depends=('vlc' 'libusb' 'gcc-libs')
source=('https://download.audiotranskription.de/f4transkript-7.0.6-linux.tar.gz')
sha256sums=('0ae4385851ebc45ce9b256b6c8e8e4de79225a4c65b05fcc163a4953b94f65e0')

package ()
{
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/f4transkript/64-bit/f4transkript ${pkgdir}/usr/bin/f4transkript
}

