# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.29
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.29/Project.Graph_2.0.29_amd64.deb')
sha256sums_x86_64=('20a4a31e50a57acb0a540db76cdbba6ec136193d155c259cac3912204dcc49b3')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
