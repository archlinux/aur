# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=skypeforlinux-bin
pkgver=1.8.0.2
pkgrel=1
pkgdesc="Skype for Linux WebRTC Alpha"
arch=('x86_64')
url="http://www.skype.com"
license=('custom')
depends=('gtk2' 'libxss' 'gconf' 'alsa-lib' 'libxtst' 'libgnome-keyring' 'nss')
source=("https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${pkgver}_amd64.deb")
sha256sums=('2f781cb82ac1a2ff6638ca009de4293a210eebea5a52718d56203ddc1c98d721')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -d "${pkgdir}/usr/share/licenses/skypeforlinux-bin"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSE" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
  mv "${pkgdir}/usr/share/skypeforlinux/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/skypeforlinux-bin/"
}
 
# vim:set ts=2 sw=2 et:
