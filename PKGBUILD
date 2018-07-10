# Chatstack (Beta) package
# Maintained by Dave Saunders - archlinux DOT org AT d-j-s DOT co

pkgname="chatstack"
pkgver=2.2.5000
pkgrel=3
pkgdesc="Live chat application for chatting with your web site visitors.  
         This package requires a web server that is already running the 
	 Chatstack server software."
arch=('i686' 'x86_64')
license=('MIT' 'unknown')

url="https://www.chatstack.com/"

depends=('gconf' 'glib2' 'gtk2' 'gvfs' 'libcap' 'libgcrypt' 'libnotify' 'libudev0' 'libxtst' 'nss' 'xdg-utils')
optdepends=('libgnome-keyring' 
	    'lsb-release')
options=('!strip' '!emptydirs')

install="${pkgname}.install"

source_i686=("${pkgname}-beta-i386.deb::https://uploads.stardevelop.com/linux/${pkgname}-${pkgver}-i386.deb")
source_x86_64=("${pkgname}-beta-amd64.deb::https://uploads.stardevelop.com/linux/${pkgname}-${pkgver}-amd64.deb")
sha256sums_i686=('67417645309af2236166c2403976f91e87a96a6f6e6ee87850a2842f399b10de')
sha256sums_x86_64=('58cc9c4128172f7c6e2ef14e8402fd62232bbc96a44dd039865bb7879d6131dc')

package () {
  msg2 "Extracting the useful files..."
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
