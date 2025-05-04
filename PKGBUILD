# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.7.6
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.7.6/Project.Graph_1.7.6_amd64.deb')
sha256sums_x86_64=('d2c04fa8909639051064f179fecd5f931e7a92bd11b6d72535c1074472513e1e')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
