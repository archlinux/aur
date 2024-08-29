#Maintainer: Noble Eugene<nobleeugene2005@gmail.com,https://www.github.com/eugenenoble2005>
#Special thanks to Coopydood<https://www.github.com/Coopydood> for designing these grub themes.
pkgname="hyperfluent-grub-theme-macos"
pkgver=1
pkgrel=1
pkgdesc="MacOS hyperfluent grub theme."
arch=(any)
url="https://github.com/Coopydood/HyperFluent-GRUB-Theme"
source=("git+https://github.com/eugenenoble2005/hyperfluent-grub-theme")
sha256sums=('SKIP')
package(){
  cd $srcdir/hyperfluent-grub-theme
  install -d -m 755 "$pkgdir/usr/share/grub/themes/$pkgname" && cp -r macos/* "$pkgdir/usr/share/grub/themes/$pkgname"
  echo "Theme installed to /usr/share/grub/themes/$pkgname. Add it to your /etc/default/grub and rebuild your grub config"
}
