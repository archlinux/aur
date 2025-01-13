# Maintainer: zty012 <me@zty012.de>
# Contributor: Littlefean <2385190373@qq.com>
pkgname=project-graph
pkgver=1.2.5
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/v$pkgver/Project.Graph_1.2.5_amd64.deb")
sha256sums_x86_64=('d6d8fc9cdab703cf594b72535fc8f049f8201d8fa4df3572c69b7a168814fa54')
conflicts=('project-graph-nightly' 'project-graph-git')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}