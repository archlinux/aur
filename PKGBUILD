# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.7
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.7/Project.Graph_2.0.7_amd64.deb')
sha256sums_x86_64=('5821ef27f217659e857d2ef288e0c0539c14065ea65eb1f941730066b95c4af0')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
