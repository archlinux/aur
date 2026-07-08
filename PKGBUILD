# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=3.4.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v3.4.0/Project.Graph_3.4.0_amd64.deb')
sha256sums_x86_64=('a8321c1d9289d862438183f15d73e24883a986f87995f1a2f5d78bd48ae55cf8')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
