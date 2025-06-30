# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-nightly-bin
pkgver=r393
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-git')
install=project-graph-nightly-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.r393_amd64.deb')
sha256sums_x86_64=('84c61c5ca1974a661c6bfe6b83fe2d82043f5c9e9027c8e17c0bea7834070bdc')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
