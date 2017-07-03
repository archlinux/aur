# Maintainer: coldBug <coldBug at e.mail dot de>

pkgname=f4transkript
pkgver=6.2.4
pkgrel=1
pkgdesc="Speeds up your transcription process"
arch=('x86_64')
url="www.audiotranskription.de"
license=('')
depends=('vlc' 'libusb' 'gcc-libs')
source=('https://www.audiotranskription.de/audot/downloadfile.php?k=1&d=39&l=en&c=1bef039b56')
sha256sums=('0f456c4f093969af58e73659383b4d7a2eb16ab87862a3bc78bfdb1625247c7f')

package ()
{
   mkdir -p ${pkgdir}/usr/bin/
   cp ${srcdir}/f4transkript/64-bit/f4transkript ${pkgdir}/usr/bin/f4transkript
}

