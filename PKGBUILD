# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.0.beta.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.0-beta.1/Project.Graph_2.0.0-beta.1_amd64.deb')
sha256sums_x86_64=('74d88623fb5835be346977f82e713513440e31162e6932608b550452d7a7d26c')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
