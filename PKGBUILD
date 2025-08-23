# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.2/Project.Graph_2.0.2_amd64.deb')
sha256sums_x86_64=('02e52c127a6a996d1e80a6f4d5e336be540b44effa8fff6df54805ae5a77e21c')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
