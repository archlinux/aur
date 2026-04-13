# Maintainer: The-Best-Codes <bestcodes dot official at gmail dot com>
pkgname=agent-one-bin
pkgver=0.0.12
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
sha256sums_x86_64=('6bfefaae1eea2971d2bd25d6ba156502f9c9cd2c6e010dfff61a3095e8e851d6')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}
