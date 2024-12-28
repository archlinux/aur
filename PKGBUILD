# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r118.af582d5c2665ddf28a501f4b99ceaae2cfda7ba7
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.af582d5c2665ddf28a501f4b99ceaae2cfda7ba7_amd64.deb")
sha256sums_x86_64=('3a2414db3bcd6551233cf0855911777c2cda0387c8f4f70855f8632a09403d76')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}