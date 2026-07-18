# Maintainer: The-Best-Codes <bestcodes dot official at gmail dot com>
pkgname=agent-one-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="AgentOne is a powerful AI agent that gives you freedom to choose your models and control your data."
arch=('x86_64')
url="https://www.agent-one.dev"
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
source_x86_64=("https://github.com/AgentOne-Dev/agent-one-public/releases/download/agent-one-v${pkgver}/AgentOne_${pkgver}_amd64.deb")
sha256sums_x86_64=('46c1ab7a16a40e4e478475f90a4dfd6b53b6219652f5b3634e167e492db2e86f')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/agent-one/updates-managed-externally"
}
