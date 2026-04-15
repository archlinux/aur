# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.13
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.13/Project.Graph_2.11.13_amd64.deb')
sha256sums_x86_64=('ab821ebd97065c7bd97cbb8d40b68b3febc6a8e1198c6a59fe68d1f564f7e1ee')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
