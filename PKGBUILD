# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r128.7ea4c9bd61a3a1258168e954ec73a0ef73923780
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.7ea4c9bd61a3a1258168e954ec73a0ef73923780_amd64.deb")
sha256sums_x86_64=('d83428c0898e329c5ba6c9197ce3ff9e531a8edbf61103b533728f017d8720a2')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}