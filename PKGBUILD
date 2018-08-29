# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=cyberark-summon-keyring
pkgver=0.2.1
pkgrel=1
pkgdesc='Cross-platform provider for Summon that talks to keyrings.'
arch=('x86_64' 'i686')
url='https://github.com/conjurinc/summon-keyring'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conjurinc/summon-keyring/archive/v${pkgver}.tar.gz")
sha256sums=('eb9b5a21cabf9f279cbdf3d77863652e0b6ddf895685832c21c453e933b4a666')
depends=('python-keyring')

package() {
  mkdir -p "${pkgdir}/usr/local/lib/summon"
  tar  --strip-components 1 -xzf $pkgname-$pkgver.tar.gz -C "${pkgdir}/usr/local/lib/summon"
}
