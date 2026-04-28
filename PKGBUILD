# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.12.4
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.12.4/Project.Graph_2.12.4_amd64.deb')
sha256sums_x86_64=('ed1fd568f0a57f8f4a0733beca9f02d361fdf8017649a9b7f223bd8304c514ba')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
