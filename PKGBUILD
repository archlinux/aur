# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.3
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.3/Project.Graph_2.11.3_amd64.deb')
sha256sums_x86_64=('aabadb7b94b412becf8479beb083478bbb36d6ebdcbd1b4b7631907d448f7896')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
