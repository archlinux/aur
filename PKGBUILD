# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest-deb
pkgver=0.9.38
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
  'gst-plugins-good'
)
provides=('readest')
conflicts=('readest' 'readest-git' 'readest-bin')
install="$pkgname.install"
source=("$url/releases/download/v$pkgver/Readest_${pkgver}_amd64.deb")
sha256sums=('ccb8c17efb8bd927dd3f66f3c841be530dd3237b8cff5e72d2e3dd621209888d')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}
