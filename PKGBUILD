# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.0
pkgrel=4
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
sha256sums=('c236b259b735d9d9666c585c92fc21da12c1f991d7af4c6288ee382ac5caed83')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
}
