# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.14.0.rc1
pkgrel=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.14.0-rc1/SlimeVR-amd64.deb")

sha512sums_x86_64=('d101622fa45477a589b450b60f765b6df225fa2f7ce7226d0dc46722cac9cdbbe51f007b4ca998ffa6236d1473a93a68380b09203b258e7f21cf4c32783d2ad3')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
  rm "${startdir}/SlimeVR-amd64.deb"
}
