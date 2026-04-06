# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.10
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.10/Project.Graph_2.11.10_amd64.deb')
sha256sums_x86_64=('e72ab4de8d15267466b73a933754a9e2d9737de21e4f469dc018e0e957ae12b3')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
