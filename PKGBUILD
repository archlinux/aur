# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=3.0.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v3.0.2/Project.Graph_3.0.2_amd64.deb')
sha256sums_x86_64=('794d128066f8d21e8b8cf92e50df30cce793919c79d482f79775a26d4410584e')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
