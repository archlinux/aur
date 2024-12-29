# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r119.252d0617ead479af936c9c69b3fa63a834201284
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.252d0617ead479af936c9c69b3fa63a834201284_amd64.deb")
sha256sums_x86_64=('6dadb937cac3f17585367bf355156674a98357bd8d6d0934b3b2b34b37cc3194')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}