# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.12.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.12.0/Project.Graph_2.12.0_amd64.deb')
sha256sums_x86_64=('5956a4acee61ebceb3e2c042641085970f6f96c2d58451fadb268e02e4f2dc2a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
