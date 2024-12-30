# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r121.c939ae190e5250081effe0b9fc4a238d01e197c3
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.c939ae190e5250081effe0b9fc4a238d01e197c3_amd64.deb")
sha256sums_x86_64=('7713dfa8b7f2aebdcfa9ce9d4391a5d38d26eba1ab64255dac2b71c80cec2d7a')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}