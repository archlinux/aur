# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-nightly-bin
pkgver=r650
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-git')
install=project-graph-nightly-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.650_amd64.deb')
sha256sums_x86_64=('fe27f3423435eedae3d6622728c83e72172800b0c7db98eebd802ff4802b2a75')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
