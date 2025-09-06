# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.12
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.12/Project.Graph_2.0.12_amd64.deb')
sha256sums_x86_64=('ba18e37ba02fd7cb9d02987e7c7c481bd708841411b5f8a6bbf4ff93fdd23d96')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
