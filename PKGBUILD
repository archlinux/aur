# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.32
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.32/Project.Graph_2.0.32_amd64.deb')
sha256sums_x86_64=('aa0b6e5d2f17edbb4e2b4813022be96d59e19cf63f12db48810fe73942d0e41c')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
