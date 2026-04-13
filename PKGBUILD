# Maintainer: The-Best-Codes <bestcodes dot official at gmail dot com>
pkgname=agent-one-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="AgentOne is a powerful AI agent that gives you freedom to choose your models and control your data."
arch=('x86_64')
url="https://github.com/AgentOne-Dev/agent-one-public"
license=('LicenseRef-proprietary')
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
provides=('agent-one')
conflicts=('agent-one')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/agent-one-v${pkgver}/AgentOne_${pkgver}_amd64.deb")
sha256sums_x86_64=('46a7ef6e54188489dc64f3178e910f0d4f9c4a366ac1c5f4ebfdf27e25c79af9')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}
