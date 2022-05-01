# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=diun
pkgver=4.21.0
pkgrel=1
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
license=('MIT')
source=("${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/crazy-max/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('83f4bfa2d9b6a036e6b024fe0b42a0aa1b356139ce756dbf52a697104ba98b65')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
