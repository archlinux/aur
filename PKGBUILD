#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=rto-proxy
pkgver=0.2.3
pkgrel=2
pkgdesc='RuTracker proxy app based at electron + angularjs'
arch=('x86_64' 'i686')
url='https://rutracker.cr/forum/viewtopic.php?t=5403116'
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'lib32-nss' 'libxss' 'nss')
options=(!strip)

source_x86_64=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.2.3/rto-proxy_0.2.3_amd64.deb")
source_i686=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.2.3/rto-proxy_0.2.3_i386.deb")
sha256sums_x86_64=('b4453fc26b39699d773934138be282256e3baeecad865e35502df193a79fc643')
md5sums_x86_64=('ba8229621770652696b07152d15d703b')
sha256sums_i686=('332c4f44c9890071f9bd86d9c26a092f7acc183c347148c84473e3a73924c75b')
md5sums_i686=('4d7ccd828131840f15b382ce5d08ff3b')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
 msg2 "Moving stuff in place..."
  
