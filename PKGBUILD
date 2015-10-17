#
# Maintainer: Ste74 <capitani74atgmaildotcom>
# Based on grub theme by Legendary Bibo

pkgname=manj-grub
pkgver=1.1
pkgrel=1
pkgdesc="Manjaro grub-theme, based on Journey theme."
url="http://i61.tinypic.com/2lboxsk.jpg"
arch=('any')
license=('GPL' 'CC-SA')
depends=('grub')
install=manj-grub.install
source=("https://github.com/Ste74/Aur-binary-repo/releases/download/v1.0/Manj-Grub.zip" "manj-grub.install")

package() {
  
  cd $srcdir
  
  find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/grub/themes/{} \;
  
}

md5sums=('cb4ffcf58eee9988f0b5fa6f88359567'
         '5cda0468fabf5feb3a0e404e97097b04')
