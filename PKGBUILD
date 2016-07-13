# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=1
pkgrel=1
pkgdesc="Skype for Linux WebRTC Alpha"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libgnome-keyring' 'nss')
source=("https://go.skype.com/skypeforlinux-64-alpha.deb")
sha256sums=('bf983023c4cea6d18709d7eb26b08cd25b32331e75525923d80e7fad6559eaa3')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}
 
# vim:set ts=2 sw=2 et:
