# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r113.7b5b42bd9502eb73129a41fb00b5f8d8e8ec574e
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.7b5b42bd9502eb73129a41fb00b5f8d8e8ec574e_amd64.deb")
sha256sums_x86_64=('84512139fe0a78b07195b37e9fa1ee1c8c885bb4ab46e3a261c43fb4c045147a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}