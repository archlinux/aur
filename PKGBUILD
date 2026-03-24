# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.7
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.7/Project.Graph_2.11.7_amd64.deb')
sha256sums_x86_64=('00d5d7c25da577070c6f9d06e1f28565a458edc5af97df07e250a7929d9915eb')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
