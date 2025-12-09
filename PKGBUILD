# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.6.6
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.6.6/Project.Graph_2.6.6_amd64.deb')
sha256sums_x86_64=('a6f030d8b85b624acf4a55101b8f268146df9867c1dde870e400add7a62ce218')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
