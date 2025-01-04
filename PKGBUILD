# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r127.fbf4d9ae80f29e669fd886f66f0304532a444b5c
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.fbf4d9ae80f29e669fd886f66f0304532a444b5c_amd64.deb")
sha256sums_x86_64=('2dc15fec2a6a31599c2500be49c14885207a24d1b6179fd0ff93d0b23fbf6f5c')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}