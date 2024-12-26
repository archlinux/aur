# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r116.7e92e9b3691de35f0e0577cfecd90775f642d491
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_1.1.0_amd64.deb")
sha256sums_x86_64=('72eac73fe57e899af0cf8329ee5b15751e30ab4ef135c78d4b59e7e2bc2c1279')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}