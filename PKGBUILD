# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=terrascan
pkgname=terrascan-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
license=('MIT')
source=("https://github.com/accurics/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9ad4c63e0b6fc4c78e236e25fcd5b80aae4e05fcd8fed43077cea7c6752bdf6f')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG.md
}

