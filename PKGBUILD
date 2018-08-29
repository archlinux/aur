# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=cyberark-summon
pkgver=0.6.7
pkgrel=1
pkgdesc='CLI that provides on-demand secrets access for common DevOps tools'
arch=('x86_64' 'i686')
url='https://github.com/cyberark/summon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyberark/summon/releases/download/v${pkgver}/summon-linux-amd64.tar.gz")
sha256sums=('60bc2ee872e00a54f97d4e390d5f076d70b639cf3574ad2bcbb9bf3f6af67227')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  tar -xzf $pkgname-$pkgver.tar.gz -C "${pkgdir}/usr/bin/"
  mv "${pkgdir}/usr/bin/summon" "${pkgdir}/usr/bin/cyberark-summon"
  chmod 0755 "${pkgdir}/usr/bin/cyberark-summon"
}
