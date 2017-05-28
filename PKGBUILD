#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=rto-proxy
pkgver=0.1.3
pkgrel=1
pkgdesc='RuTracker proxy app based at electron + angularjs'
arch=('x86_64' 'i686')
url='https://rutracker.cr/forum/viewtopic.php?t=5403116'
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'lib32-nss' 'libxss' 'nss')
options=(!strip)

source_x86_64=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.1.3/rto-proxy_0.1.3_amd64.deb")
source_i686=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.1.3/rto-proxy_0.1.3_i386.deb")
sha256sums_x86_64=('2e87ef606068a32397b36f1e39c9f53780f9c30eb2e503520a957b058104c119')
md5sums_x86_64=('ccf210b40983f8811e9b39ff1b8fe82e')
sha256sums_i686=('fd893568037afecb93f1e3e056d976e6db7832d38b2d0d54bfba23d5b43df130')
md5sums_i686=('1b310dd4b25bab83716a80617f906b9f')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 msg2 "Moving stuff in place..."
  
