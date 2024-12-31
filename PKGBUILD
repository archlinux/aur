# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r122.feae6f4446aade8ba25d9a8cb116d378458f7ff6
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph' 'project-graph-git')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.feae6f4446aade8ba25d9a8cb116d378458f7ff6_amd64.deb")
sha256sums_x86_64=('6ff9673a150216ba9070417085918dc756fe656370d85a3bea8da783c040769a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}