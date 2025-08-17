# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-nightly-bin
pkgver=r413
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=('project-graph')
conflicts=('project-graph-bin' 'project-graph-git')
install=project-graph-nightly-bin.install
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.r413_amd64.deb')
sha256sums_x86_64=('0dc7fc7b868c93e74028e470e81bb6a6d1925fce83026ec1f184a88bf672f0f3')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
