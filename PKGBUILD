# Maintainer: The-Best-Codes <bestcodes dot official at gmail dot com>
pkgname=agent-one-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="AgentOne is a powerful AI agent that gives you freedom to choose your models and control your data."
arch=('x86_64')
url="https://www.agent-one.dev"
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
provides=('agent-one')
conflicts=('agent-one')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("https://github.com/AgentOne-Dev/agent-one-public/releases/download/agent-one-v${pkgver}/AgentOne_${pkgver}_amd64.deb")
sha256sums_x86_64=('ae6416fa3a0f2fc6a815a95765bca6c5185ee47f74adf86d9911f8ada53fc3e8')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/agent-one/updates-managed-externally"
}
