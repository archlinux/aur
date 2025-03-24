# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest
pkgver=0.9.25
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
sha256sums=('9cb3cc18353157147c313d9c1ef2878fa927bd0bece07decba01b9c0e72e1f80')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}
