# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.8.1
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.8.1/Project.Graph_1.8.1_amd64.deb')
sha256sums_x86_64=('5dc7e6fbb35636b8b00eaa6d814282f26e421a9f54e27f175f936b6a17cdc1c3')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
