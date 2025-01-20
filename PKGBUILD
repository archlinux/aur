# Maintainer: Alfie Rayner <aa.rayner@outlook.com>
pkgname=opentaikohub-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Description of your app"
arch=('x86_64')
url="https://github.com/OpenTaiko/OpenTaiko-Hub"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/OpenTaiko/OpenTaiko-Hub/releases/download/v$pkgver/OpenTaiko.Hub_"$pkgver"_amd64.deb")
sha256sums_x86_64=('ac7dc2c6273e3f7b7403803c266dbe27a74dd221266627f82cad781e6bab3b37')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/OpenTaikoHub/opentaikohub" "$pkgdir/usr/bin/OpenTaiko-Hub" 

}
