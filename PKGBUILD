# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplebench-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='A workspace for terminal-driven development'
arch=('x86_64')
url='https://github.com/MaciejKolerski/simplebench'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=('git: source control and repository history')
provides=('simplebench')
conflicts=('simplebench')
options=('!strip' '!debug')
source_x86_64=("SimpleBench_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/SimpleBench_${pkgver}_amd64.deb")
# The publication workflow replaces SKIP with the released DEB's SHA-256.
sha256sums_x86_64=('4dc88ea8bffbaa0d171f91e07ec67390f1712cba33c8e1a104ce56614237554d')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
