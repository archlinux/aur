# Maintainer: r3g1s <21206554+r3b1s [at] users [dot] noreply [dot] github [dot] com>
pkgname=skillctl
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage agent skills across AI harnesses."
arch=('any')
url="https://github.com/r3b1s/skillctl"
license=('MIT')
depends=('bash' 'git' 'gum')
source=("https://github.com/r3b1s/skillctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05baabeb575b125bf43f7f837ee83793080de8785a3bbc9c1e97c72c9ad1b8db')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 skillctl "${pkgdir}/usr/bin/skillctl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
