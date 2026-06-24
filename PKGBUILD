# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=3.2.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v3.2.1/Project.Graph_3.2.1_amd64.deb')
sha256sums_x86_64=('21d51d43cb84981320c3b014f96c26a1e572486502a95146dc2f6d2a3e3b229a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
