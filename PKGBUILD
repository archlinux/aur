# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.4.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.4.0/Project.Graph_2.4.0_amd64.deb')
sha256sums_x86_64=('6cf6c6081129bf7d6eb4dc3f3eec088db47017b4a94d135e685bbf7afcb9d3d8')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
