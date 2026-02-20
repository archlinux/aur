pkgname=opennexus-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Thin CLI client for the Nexus context-driven development system"
arch=('x86_64')
url="https://github.com/Alpha-Innovation-Labs/opennexus"
license=('MIT')
provides=('opennexus')
conflicts=('opennexus')
source=(
  "opennexus-x86_64-unknown-linux-gnu::https://github.com/Alpha-Innovation-Labs/opennexus/releases/download/v${pkgver}/opennexus-x86_64-unknown-linux-gnu"
)
sha256sums=(
  'a40d055ad1905b8a02b5366fa91dd41c6abe7b907247f5402f79221398f9db93'
)

package() {
  install -Dm755 "${srcdir}/opennexus-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/opennexus"
}
