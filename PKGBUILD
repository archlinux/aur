# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly-bin
pkgver=r300
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-git')
install=${pkgname}.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/')
sha256sums_x86_64=('d4770288f34ef4841cbcb4ab45a29d7d33becf7f28f8c6be9453a5123dc9ad8c')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
