# Maintainer: r3g1s <21206554+r3b1s [at] users [dot] noreply [dot] github [dot] com>
pkgname=skillctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Manage agent skills across AI harnesses."
arch=('any')
url="https://github.com/r3b1s/skillctl"
license=('MIT')
depends=('bash' 'git' 'gum')
source=("https://github.com/r3b1s/skillctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cbbd74a1ed02633e12b0d726f938dc4892461682759d756e91cf8ec641c8d413')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 skillctl "${pkgdir}/usr/bin/skillctl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
