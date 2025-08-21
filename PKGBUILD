# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.1/Project.Graph_2.0.1_amd64.deb')
sha256sums_x86_64=('c157243b1cc95ea9daa8b68f2b6199c403e9989c57637effc2c5b2ada2fe3558')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
