# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.8.0-beta.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.8.0-beta.1/Project.Graph_1.8.0-beta.1_amd64.deb')
sha256sums_x86_64=('984861d110a9d17684c981bec27bb13afadee0f51dfea77b4628798e491ecd62')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
