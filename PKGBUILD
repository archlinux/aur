# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r124.a27d5dd35475491ecfca5f799d446ffa1fc9a3e7
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph' 'project-graph-git')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.a27d5dd35475491ecfca5f799d446ffa1fc9a3e7_amd64.deb")
sha256sums_x86_64=('133e8150198b593cc2638ed76348f0f0df3b8b862b7de4b76d882d0f765c1e03')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}