# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=lomi-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='A workspace for terminal-driven development'
arch=('x86_64')
url='https://github.com/lomi-dev/lomi'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=(
  'git: source control and repository history'
  'org.freedesktop.secrets: remember account sessions and securely store AI API keys'
)
provides=('lomi')
conflicts=('lomi')
options=('!strip' '!debug')
source_x86_64=("Lomi_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Lomi_${pkgver}_amd64.deb")
# The publication workflow replaces SKIP with the released DEB's SHA-256.
sha256sums_x86_64=('f134dca75dd5499354630437bb9d2d43cfa1c1553815033f14fda59a5dc4ee3d')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
