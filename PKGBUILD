# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r123.828dd9622c177a8bed78c2ad6439bd8936f2c58c
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.828dd9622c177a8bed78c2ad6439bd8936f2c58c_amd64.deb")
sha256sums_x86_64=('1fae8c4f2ba53a33111f6754b89d46885b1a640d3c6ed2dbfdf9ad40bb9b53bd')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}