# Maintainer: zty012 <me@zty012.de>
pkgname=project-graph-bin
pkgver=1.7.10
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
source_x86_64=('https://github.com/LiRenTech/project-graph/releases/download/v1.7.10/Project.Graph_1.7.10_amd64.deb')
sha256sums_x86_64=('679a46ea5dcf8384e7dded193d42e85a8bc363ec2c5f787fd0b82988c9f4046f')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
