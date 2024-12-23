# Maintainer: zty012 <me@zty012.de>
# Maintainer: Littlefean <2385190373@qq.com>
pkgname=project-graph-nightly
pkgver=r112.3e28db62137d87078a9816b738f09ee8db065444
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
source_x86_64=("https://github.com/LiRenTech/project-graph/releases/download/nightly/Project.Graph_0.0.0-nightly.3e28db62137d87078a9816b738f09ee8db065444_amd64.deb")
sha256sums_x86_64=('b64008890a7701a984b9dbf456096a2d53878b7534bf9cb0f1b60e0e08b46032')
package() {
  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
}