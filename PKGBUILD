# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.6.3
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.6.3/Project.Graph_2.6.3_amd64.deb')
sha256sums_x86_64=('c5bf7957ab3febacc0b872474a5808796d50d7a02da1d754793b3e43084e0a47')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
