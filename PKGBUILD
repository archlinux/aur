# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.12.3
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-nightly-bin' 'project-graph-git')
install=project-graph-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.12.3/Project.Graph_2.12.3_amd64.deb')
sha256sums_x86_64=('c58e73328a073ac6c2158b5700b2ee5c3b56adb3898170a3a919c4645a78d2c6')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
