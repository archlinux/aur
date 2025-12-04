# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkgname=terrascan
pkgname=$_pkgname-bin
pkgver=1.19.9
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
conflicts=('terrascan')
provides=('terrascan')
license=('Apache-2')
source=("https://github.com/accurics/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9275d75210b7df52f8870252035803288646674f5701ced82812037700a39670')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
