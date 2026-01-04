pkgname=lettuceai-bin
pkgver=1.0.0.beta.2
pkgrel=1
pkgdesc="LettuceAI is a private roleplay chat client. Build characters, write stories, and chat with AI."
arch=('x86_64')
url="https://github.com/LettuceAI/mobile-app"
license=('AGPL-3.0')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!debug')
install=${pkgname}.install

source_x86_64=("${url}/releases/download/1.0.0/lettuceai_1.0.0-beta-2_amd64.deb")
sha256sums_x86_64=('ca08abe2d8e4a6033efd6bc0093d490a9ca45ac58ff3aed0d15f71a1478d929d')

package() {
  rm -rf "${pkgdir}/usr/lib/lettuceai"
  tar -xvf data.tar.gz -C "${pkgdir}"
}
