# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.1.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.1.2/Project.Graph_2.1.2_amd64.deb')
sha256sums_x86_64=('30f4457d8825438d721355b0eacfc0ab89f8f856adc2f373e1a46b70814e2b3e')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
