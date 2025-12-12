# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-nightly-bin
pkgver=r541
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.541_amd64.deb')
sha256sums_x86_64=('859f261993b328e2e9e0208c993b51e09c985d251f22088accd0970a2f006e93')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
