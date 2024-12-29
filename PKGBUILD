# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r120.a1a8078ce9ce84c617e2f4369af8f690c736bbce
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.a1a8078ce9ce84c617e2f4369af8f690c736bbce_amd64.deb")
sha256sums_x86_64=('86db77fb7e867d6cc4c0f287b1601c70da411f31298e0d40bd7e88c6ac6b37b6')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}