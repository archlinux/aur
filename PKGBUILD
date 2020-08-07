# Maintainer: nemesys

pkgname=fbcondecor-openrc
pkgver=5.7.12
pkgrel=1
pkgdesc="Simple openrc service to activate console decorations on system start. Requires fbsplash and a kernel with fbcondecor patch applied."
arch=('any')
url="http://sourceforge.net/projects/fbsplash.berlios/"
license=('GPL')
depends=('fbsplash') 
optdepends=('linux-fbcondecor: enable console background images'
'linux-ck-fbcondecor: enable console background images and linux-ck kernel patchset')
conflicts=('fbsplash-scripts' 'initscripts-extras-fbsplash')
install=$pkgname.install
source=('fbcondecor')
md5sums=('434dcb00413ad01a5c6873536fccc302')

package() {
  msg2 "Installing fbcondecor for openrc support.."
  # Install fbcodecor script and config file
  install -Dm644 "$srcdir/fbcondecor" "$pkgdir/etc/init.d/fbcondecor"
}
