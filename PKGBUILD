# Maintainer: slbsh <crafter.antek@gmail.com>
# Contributor: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.7.0
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
makedepends=('nodejs>=22.0.0' 'npm')
source=("${url}/archive/refs/tags/grain-v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!strip)

package() {
  cd "$srcdir/grain-grain-v${pkgver}"
  sudo npm ci
  sudo npm run compiler build
}
