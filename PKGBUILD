# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=2.12.2
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v2.12.2/Project.Graph_2.12.2_amd64.deb')
sha256sums_x86_64=('503cf5afa050f711f07c04f5450bf97dc37a74253ee3ad74e0c7e5311e2b4f41')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
