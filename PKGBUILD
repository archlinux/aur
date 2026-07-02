# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=3.2.4
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v3.2.4/Project.Graph_3.2.4_amd64.deb')
sha256sums_x86_64=('4aaad6e31154d83a55b0c0217f7610d212cf8e85ec3c045f81884e0568ee7b30')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
