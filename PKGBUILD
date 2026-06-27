# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.0
pkgrel=1
pkgdesc='Command-line AI assistant'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('custom:unlicensed')
depends=('chafa' 'gcc-libs' 'ripgrep')
optdepends=(
  'fish: fish shell hook support'
  'bash: bash shell hook support'
  'zsh: zsh shell hook support'
)
source=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('f05d3fcd7b69d4bd48d9f6b952aeed59f6b09ae61707a41ef036ea5c67dbb720')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
}
