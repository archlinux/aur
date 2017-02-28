# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=f4transkript
pkgver=6.2.1
pkgrel=1
pkgdesc="Speeds up your transcription process"
arch=('x86_64')
url="www.audiotranskription.de"
license=('')
depends=('vlc' 'libusb' 'gcc-libs')
source=('https://www.audiotranskription.de/audot/downloadfile.php?k=1&d=39&l=en&c=1bef039b56')
sha256sums=('4ca3f324b62bb8c87f7955d5f42cd5dfe4b2933592fa060fe1473d81aa431882')

package ()
{
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/f4transkript/64-bit/f4transkript ${pkgdir}/usr/bin/f4transkript
}

