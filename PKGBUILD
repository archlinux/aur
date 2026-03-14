# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.5
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.5/Project.Graph_2.11.5_amd64.deb')
sha256sums_x86_64=('06010cc46950ed16d8b0cd9b562879b9965873f19499a22ebadd0251ab7e734f')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
