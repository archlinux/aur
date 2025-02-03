# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest
pkgver=0.9.8
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
sha256sums=('42b25aef28bbe02a5777f5f602da8827faef0580e423f046a7dd0c5cc9eb6ab7')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}

