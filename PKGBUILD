# Maintainer: Zachary <22am014@sctce.ac.in>

pkgname=linear-desktop-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Unofficial Linux desktop client for Linear (linear.app), built with Tauri"
arch=('x86_64')
url="https://github.com/zacharyftw/linear-linux"
license=('ISC')
depends=(
  'cairo'
  'desktop-file-utils'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
provides=('linear-desktop')
conflicts=('linear-desktop' 'linear-desktop-git')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/Linear_${pkgver}_amd64.deb")
sha256sums_x86_64=('1e9ddf4f50c0bde993de3950109a83174897c1b426d3e5aeb4cffffcee63e182')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}
