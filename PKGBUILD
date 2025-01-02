# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r125.0a792daf7827a59d65249ada9ab7d3c9cfda382b
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.0a792daf7827a59d65249ada9ab7d3c9cfda382b_amd64.deb")
sha256sums_x86_64=('4f97f71c452ef733ad0b8c658c34a6c3e2f62120587a44ad9659f81319202ec4')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}