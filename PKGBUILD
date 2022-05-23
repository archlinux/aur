# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terrascan
pkgver=1.15.1
pkgrel=2
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
license=('Apache-2')
source=("https://github.com/accurics/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('86a5fde81086d4e4a165914a8718ebacce930aa2ca0ed24d94418a5e3272c118')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
