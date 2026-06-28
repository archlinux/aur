# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.0
pkgrel=5
pkgdesc='Command-line AI assistant'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('custom:unlicensed')
depends=('chafa' 'gcc-libs' 'ripgrep')
optdepends=(
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
source=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('7fca18bcabee34006ac357de502ecee1685f5481c028337f28551a058e59c863')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
}
