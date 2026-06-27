# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.0
pkgrel=3
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
sha256sums=('e15c666223ed7516ba08cce9a3d2dd14e40b6a06c73c347dfa224a77e6dfc0d6')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
}
