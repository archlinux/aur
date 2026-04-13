# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.11.12
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.11.12/Project.Graph_2.11.12_amd64.deb')
sha256sums_x86_64=('b26121beccbdcc90b1f282ce7b11bba20cfb5d884a0b7acf18af6df07b3fd2d1')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
