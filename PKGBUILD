# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.3.0
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.3.0/Project.Graph_2.3.0_amd64.deb')
sha256sums_x86_64=('ba96a8cb056aba81b83be2efa8c661af6b000caac68ceacb21c534aad5746c2e')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
