# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=lomi-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='A workspace for terminal-driven development'
arch=('x86_64')
url='https://github.com/lomi-dev/lomi'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=('git: source control and repository history')
provides=('lomi')
conflicts=('lomi')
options=('!strip' '!debug')
source_x86_64=("Lomi_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Lomi_${pkgver}_amd64.deb")
# The publication workflow replaces SKIP with the released DEB's SHA-256.
sha256sums_x86_64=('27df15d80643570ec4e439d320dfa7711dffe9ba35e2a96bdd434a32de802599')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
