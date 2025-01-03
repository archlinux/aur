# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r126.1efed35d6fabee800ac8460a4c8d460eeebba569
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.1efed35d6fabee800ac8460a4c8d460eeebba569_amd64.deb")
sha256sums_x86_64=('61c70c8b1ef39fa51649a1cda30aa932e52382c824865f08f4fd6a5d737ae11e')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}