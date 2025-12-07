# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.6.4
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.6.4/Project.Graph_2.6.4_amd64.deb')
sha256sums_x86_64=('de2aec4aa083166196e76d4dbef3c9faf41d40ceaf255f9501e93cfa6aa29c24')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
