# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplebench-bin
pkgver=0.4.0
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
sha256sums_x86_64=('b8c9b7f70fc15e50c374a183195b15ed775e6f84ec66295c267d2f79519a7af0')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
