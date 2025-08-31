# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.8
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.8/Project.Graph_2.0.8_amd64.deb')
sha256sums_x86_64=('22685b52f7f25fdbd817b9e4305eefcb02ce23e3b64f780b7cdba31fcd3a5033')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
