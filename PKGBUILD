# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplebench-bin
pkgver=0.1.0
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
sha256sums_x86_64=('32db1a00d8c0d9e7548c25507f5d9d1288978b64e0e9ffbe64f99633d6cfa847')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
