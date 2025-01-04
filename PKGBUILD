# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest
pkgver=0.8.9
pkgrel=2
pkgdesc='Modern, feature-rich ebook reader designed for avid readers offering seamless cross-platform access, powerful tools, and an intuitive interface'
arch=('x86_64')
url='https://github.com/readest/readest'
license=('AGPL-3.0-or-later')
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
install="$pkgname.install"
source=("$url/releases/download/v$pkgver/Readest_${pkgver}_amd64.deb")
sha256sums=('5beb417b7dd125c13a8d5e3c7d663c4b23757618aa32a09400c85912f4a2dc0f')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}

