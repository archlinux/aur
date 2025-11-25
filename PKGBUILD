# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.5.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.5.2/Project.Graph_2.5.2_amd64.deb')
sha256sums_x86_64=('a5311f26506db0a78af13e9842427ed31d72cfc9aa834dcc3d2a1b0777c3b4be')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
