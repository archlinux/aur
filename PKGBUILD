# Maintainer: zty012 <me@zty012.de>
# Contributor: Littlefean <2385190373@qq.com>
pkgname=project-graph-bin
pkgver=1.4.31
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/v$pkgver/Project.Graph_1.4.31_amd64.deb")
sha256sums_x86_64=('282fed50de099727b5e5da561c0cb689f9b0fe35b192b9eca4ed6a1e55ecc5a7')
provides=('project-graph')
conflicts=('project-graph-nightly-bin' 'project-graph-git')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
