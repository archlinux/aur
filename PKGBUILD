# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest
pkgver=0.9.3
pkgrel=1
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
sha256sums=('f4f4915e93ef5173f97043b2e57568f968c4e88eed3c5d9fa4017d5a2b0a7bcd')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}

