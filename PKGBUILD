# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.1.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.1.0/Project.Graph_2.1.0_amd64.deb')
sha256sums_x86_64=('a745efe8c1652e0050bd93977a9818311ec6cd9fe20d0296886c6d7d27afdc2b')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
