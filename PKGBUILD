# Maintainer: MareDevi <maredevi at foxmail dot com>

pkgname=readest-deb
pkgver=0.9.41
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
sha256sums=('8490603c98453f66dff3747f1ee64a2771c87e85417ec61d636f983f4cac841e')

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "$pkgdir"

}
