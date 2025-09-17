# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.0.20
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-nightly-bin' 'project-graph-git')
install=project-graph-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.0.20/Project.Graph_2.0.20_amd64.deb')
sha256sums_x86_64=('776f0721beffc2bb7e5e59c85d7610d1bde11225da2960215a64491d5d02b4b7')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
