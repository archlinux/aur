# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=lomi-bin
pkgver=0.5.3
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
sha256sums_x86_64=('401b249b0fdfc1f3bc10e175928c9b8cee43de558af47dfbfd943433d7a85759')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
