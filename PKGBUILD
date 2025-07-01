# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.16.0
pkgrel=2
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.16.0/SlimeVR-amd64.deb"
)

sha512sums_x86_64=(
  '8cdfb8a05f726a0d771707566bb69c4d9df2b85fbc748ce9fab751a6fdb252547bfdad531a1d0b90ad4fdcd087bb683197e2e88fe3d39a26286295c9003b49c1'
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

  rm "${startdir}/SlimeVR-amd64.deb"
}
