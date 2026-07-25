# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.4.26
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
sha256sums=('1b520756ecfc28ad81981a2cd5cc6688f785f447b3f5d8d553544906f59bf521')

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
