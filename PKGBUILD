# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.0.rc.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.0-rc.1/Project.Graph_2.0.0-rc.1_amd64.deb')
sha256sums_x86_64=('1b2004c48d2e7fa3179db062143cce68d698c22b5af2b3aedba8d5cd418a1881')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
