# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r117.7a0f7bf87f7bf1457edd5bfe4f11d6951a72e453
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
sha256sums_x86_64=('289b28c9153ec2fd281bce5e81b3a91bf5532f92b1ca66c52abb385e82a53bc1')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}