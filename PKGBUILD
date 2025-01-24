# Maintainer: zty012 <me@zty012.de>
# Contributor: Littlefean <2385190373@qq.com>
pkgname=project-graph-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple tool to create topology diagrams."
arch=('x86_64')
url="https://github.com/LiRenTech/project-graph"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/v$pkgver/Project.Graph_1.3.0_amd64.deb")
sha256sums_x86_64=('bab4664603cd03ed83e033ceb74e797728cbf57c3c45dc29df068a5e16c500d2')
provides=('project-graph')
conflicts=('project-graph-nightly-bin' 'project-graph-git')
package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

}
