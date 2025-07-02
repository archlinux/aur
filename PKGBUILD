# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.16.0
pkgrel=3
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
  "https://github.com/SlimeVR/SlimeVR-Server/raw/b978eaf3f15e8f26ecddb912079d3788f6d26f44/gui/src-tauri/69-slimevr-devices.rules"
)

sha512sums_x86_64=(
  '8cdfb8a05f726a0d771707566bb69c4d9df2b85fbc748ce9fab751a6fdb252547bfdad531a1d0b90ad4fdcd087bb683197e2e88fe3d39a26286295c9003b49c1'
  ''a79ec51763ea2ee66fce15482bfa62deb6e254e75aac4999e1df3688027ad1d191cd8fa3e9ef4d64138b5097f50bf1f7f20f4e13dede5ce42a515a3f77af29ab
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

  rm "${startdir}/SlimeVR-amd64.deb"
}
