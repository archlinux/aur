# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.9.9
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.9.9/Project.Graph_2.9.9_amd64.deb')
sha256sums_x86_64=('de2a95fc88976b90f70803607d254e7d9279184aab926076b8a87e1c844765fa')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
