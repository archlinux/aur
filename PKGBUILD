# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.10.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.10.2/Project.Graph_2.10.2_amd64.deb')
sha256sums_x86_64=('dc5feb610bd37a6feb4d7e4216d9896111bd3bc133942117200f75f3f43a59db')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
