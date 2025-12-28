# Maintainer: MegalithOfficial <https://github.com/megalithofficial>

pkgname=lettuceai-bin
pkgver=1.0.0.beta.6.2
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

source_x86_64=("${url}/releases/download/1.0-beta.6.2/lettuceai_1.0.0-beta.6-2_amd64.deb")
sha256sums_x86_64=('7bf0170a9f41a870afe2cbaa351ce46b2da9fd1cbadbc9ba7ba06999917be249')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}
