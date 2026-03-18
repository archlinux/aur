# Maintainer: r3g1s <21206554+r3b1s [at] users [dot] noreply [dot] github [dot] com>
pkgname=skillctl
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple tool for managing agent skills across AI coding harnesses. Uses symlinks to establish a single source of truth. Not a skill browser or search engine. Does what it says on the tin and no more.'
arch=('any')
url='https://github.com/r3b1s/skillctl'
license=('MIT')
depends=('bash' 'git' 'gum')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/r3b1s/skillctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f673e8458835bebad9e27d2709530185a97396f196f4941186b7968b24a4a9f')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 skillctl "${pkgdir}/usr/bin/skillctl"
}
