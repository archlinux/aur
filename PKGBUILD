# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly-bin
pkgver=r283
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.r266_amd64.deb")
sha256sums_x86_64=('ef61542a3221b8e388aa1f6530197674e826176056cd8402512ce501cefb33de')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}

