# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=3.0.0.alpha.3
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v3.0.0-alpha.3/Project.Graph_3.0.0-alpha.3_amd64.deb')
sha256sums_x86_64=('78d396eb289d2299bb3ac7469938d2c00cf1003eb8f8a4e3789be7093f0cfd86')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
