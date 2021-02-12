# Maintainer Filip Parag <aur@filiparag.com>

pkgname=sydf
pkgver=0.3
pkgrel=2
pkgdesc="Symlink dotfiles"
arch=('any')
url="https://github.com/filiparag/sydf"
license=('GPL3')
depends=('bash' 'coreutils' 'findutils' 'sudo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d22297a611e19ba754a26f7f347316b904ba0a93c8957ad2adb916d12b90df55')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}