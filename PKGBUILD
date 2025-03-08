# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest
pkgver=0.9.19
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
sha256sums=('fe744305dc90f43e5a53a17776611ed160b40280613c49e272be13a629db397b')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}
