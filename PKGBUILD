# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=f4transkript
pkgver=6.2.5
pkgrel=1
pkgdesc="Speeds up your transcription process"
arch=('x86_64')
url="www.audiotranskription.de"
license=('')
depends=('vlc' 'libusb' 'gcc-libs')
source=('https://www.audiotranskription.de/audot/downloadfile.php?k=1&d=39&l=en&c=1bef039b56')
sha256sums=('12cb14ea53235a9cebaab599df30ed6af19722f4b5463d8e21838cdb4e63d65c')

package ()
{
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/f4transkript/64-bit/f4transkript ${pkgdir}/usr/bin/f4transkript
}

