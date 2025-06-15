# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.8.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.8.0/Project.Graph_1.8.0_amd64.deb')
sha256sums_x86_64=('c931583ea111b370e60ff3501ad032b4ca905e10f0a1f7d461ae6514eb2b270d')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
