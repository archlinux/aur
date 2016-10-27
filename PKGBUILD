# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=f4transkript
pkgver=f4v6
pkgrel=1
pkgdesc="Speeds up your transcription process"
arch=('x86_64')
url="www.audiotranskription.de"
license=('')
depends=('vlc' 'libusb' 'gcc-libs')
source=('https://www.audiotranskription.de/audot/downloadfile.php?k=1&d=39&l=en&c=1bef039b56')
sha256sums=('cd8057502f1de5586ad3d6b15c3d1205df774948e298d169d4932cabff447710')

package ()
{
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/f4transkript/64-bit/f4transkript ${pkgdir}/usr/bin/f4transkript
}

