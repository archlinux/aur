pkgname=lettuceai-bin
pkgver=1.0.0.beta.4
pkgrel=1
pkgdesc="LettuceAI is a private roleplay chat client. Build characters, write stories, and chat with AI."
arch=('x86_64')
url="https://github.com/LettuceAI/app"
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

source_x86_64=("${url}/releases/download/1.2.0/lettuceai_1.0.0-beta-4_amd64.deb")
sha256sums_x86_64=('8efe1217e3376501bd37614fa8625dd6b1031ee5fad0e71525f7bba7280b5779')

package() {
  rm -rf "${pkgdir}/usr/lib/lettuceai"
  tar -xvf data.tar.gz -C "${pkgdir}"
}
