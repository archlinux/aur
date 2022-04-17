# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=terrascan
pkgname=terrascan
pkgver=$PKGVER
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
license=('Apache-2')
source=("https://github.com/accurics/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a1794b588546428ae2fb8e541f205960648adccb2aa30b1e4a4c59488e177354')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG.md
}
