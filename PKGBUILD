# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.9.8
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.9.8/Project.Graph_2.9.8_amd64.deb')
sha256sums_x86_64=('b2ee34d19097cff33d05aef645070daa3f3d998ce8f82c3ffd3275d4d8e2c63f')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
