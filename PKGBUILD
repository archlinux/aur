# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-nightly-bin
pkgver=r708
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-git')
install=project-graph-nightly-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.708_amd64.deb')
sha256sums_x86_64=('760e1a26ec8ecf39705f424847db732e7ea5ca6c443ce30b695377bd4d4dd2c0')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
