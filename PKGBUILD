# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=terrascan
pkgname=terrascan
pkgver=1.12.0
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
license=('Apache-2')
source=("https://github.com/accurics/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('e2ce60a655bdd8baa24f3b90c7da4ce0d2df41987fc87351a5a00ce8e26e6996')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG.md
}
