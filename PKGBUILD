#
# Maintainer: Ste74 <capitani74atgmaildotcom>
# Based on grub theme by Legendary Bibo
# Thanks to gohlip 

pkgname=manj-grub
pkgver=1.2
pkgrel=2
pkgdesc="Manjaro grub-theme, based on Journey theme."
url="http://i59.tinypic.com/nwy07s.jpg"
arch=('any')
license=('GPL' 'CC-SA')
depends=('grub')
install=manj-grub.install
source=("https://github.com/Ste74/Aur-binary-repo/releases/download/v1.0/Manj-Grub.zip" "manj-grub.install")
replaces=('manj-grub')
package() {
  
  cd $srcdir
  
  find . -type f -exec install -D -m644 {} ${pkgdir}/usr/share/grub/themes/{} \;
  
}

md5sums=('3aff6f2bc83b04125839b294e54ba574'
         'cec20af2c76c8f3ea2a5e37cc13163bf')
