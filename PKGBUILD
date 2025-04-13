# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly-bin
pkgver=r294
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
sha256sums_x86_64=('b66c272938c9c221c86bf5fb6063f9e8ef0bdc95280c0b5d882c02578d4b039f')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
