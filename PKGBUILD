# Maintainer: Michael Corrigan <ghost.vonage AT gmail DOT com>
# Contributor: tomsik68	<tomsik68 AT gmail DOT com>
# Contributor: gandl <gandlspam AT gmail DOT com>
# Contributor: Jristz <prflr88 AT gmail DOT com>
# Upstream URL: http://messengerfordesktop.com/

pkgname=messengerfordesktop
pkgver=v1.4.3
pkgrel=1
pkgdesc="Beautiful desktop client for Facebook Messenger. Chat without being distracted by your feed or notifications."
PKGEXT='.pkg.tar'
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
options=(!strip)
depends_x86_64=('gcc-libs-multilib')
depends_i686=('gcc-libs')
depends=('cairo' 'libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'fontconfig' 'nss')
install=$pkgname.install
md5sums_x86_64=('5c8862382e96c32a1878ce6f25a5b8da')
source_x86_64=("https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/$pkgver/Messenger_linux64.deb")
md5sums_i686=('0e7cd18730933f97aa2f23cf1fef5933')
source_i686=("https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/$pkgver/Messenger_linux32.deb")
package() {
  bsdtar xf data.tar.gz
  chmod -R g-w opt
  chmod -R g-w usr
  mv opt "${pkgdir}"
  mv usr "${pkgdir}"
}
