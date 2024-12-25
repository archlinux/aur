# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r114.5fe75703cf5f69cb7c566d2571db5a03226142c4
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.5fe75703cf5f69cb7c566d2571db5a03226142c4_amd64.deb")
sha256sums_x86_64=('6f486c7d01b07bb1b778f9c7137b8044716a263f26f4cf9c59bf2214a47a334a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}