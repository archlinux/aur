# Maintainer: zty012 <me@zty012.de>
# Contributor: Littlefean <2385190373@qq.com>
pkgname=project-graph-bin
pkgver=1.4.28
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/v$pkgver/Project.Graph_1.4.28_amd64.deb")
sha256sums_x86_64=('f7ab83bbede9ff6597cf171078f500334159f236b04b571e28cb44bf311dc10f')
provides=('project-graph')
conflicts=('project-graph-nightly-bin' 'project-graph-git')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
