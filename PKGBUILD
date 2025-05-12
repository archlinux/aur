# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.7.9
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.7.9/Project.Graph_1.7.9_amd64.deb')
sha256sums_x86_64=('dae899e58f2fc3aa5ed895005e9f9936378a39281f0eb4e38c53a92546125348')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
