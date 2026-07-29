# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='A workspace where humans and agents build together, on a relay you own'
arch=('x86_64')
url='https://buzz.xyz'
license=('Apache')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'zlib'
)
provides=('buzz')
conflicts=('buzz')
source=("https://github.com/block/buzz/releases/download/v${pkgver}/Buzz_${pkgver}_amd64.deb")
sha256sums=('9674cf098eca88333e8d895ec9d0a5c56c796fbc358fe1087b645890b8e2faca')

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
