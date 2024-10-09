# Maintainer: zty012 <me@zty012.de>
# Contributor: Littlefean <2385190373@qq.com>
pkgname=project-graph
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/v$pkgver/Project.Graph_"$pkgver"_amd64.deb")
sha256sums_x86_64=('SKIP')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}