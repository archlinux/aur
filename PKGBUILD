# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r111.b212a7e7b1012efe6b424833a5d48aee9398f4ad
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.b212a7e7b1012efe6b424833a5d48aee9398f4ad_amd64.deb")
sha256sums_x86_64=('dcedc583bf56ea1f347715470d11938583302f92c769579aaaa8ffd393a3c035')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}