#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=rto-proxy
pkgver=0.1.3
pkgrel=1
pkgdesc='RuTracker proxy app based at electron + angularjs'
arch=('x86_64')
url='https://rutracker.cr/forum/viewtopic.php?t=5403116'
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'lib32-nss' 'libxss' )
options=(!strip)
source=('github')
source=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.1.3/rto-proxy_0.1.3_amd64.deb")

sha256sums=('2e87ef606068a32397b36f1e39c9f53780f9c30eb2e503520a957b058104c119')
md5sums=('ccf210b40983f8811e9b39ff1b8fe82e')
validpgpkeys=('BC02894E554D22A62D381930300E89650A716A5A')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 msg2 "Moving stuff in place..."
  
