# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.7.11
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.7.11/Project.Graph_1.7.11_amd64.deb')
sha256sums_x86_64=('7532fd279e9c98116d4fba80e182c250b48b375b4cf5dd86cf2ccf2041aee2be')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
