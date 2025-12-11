pkgname=nanchat
pkgver=0.1.1
pkgrel=1
pkgdesc="Nano Super APp"
arch=('x86_64')
url="https://github.com/yxse/nanchat"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/app-v${pkgver}/NanChat_${pkgver}_amd64.deb")
sha256sums_x86_64=("8f43942738ccde45efe34be0d29dfeb3e2df5f46e58380e6a3cc3dba2b91a00b")
package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"

}
