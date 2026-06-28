# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.0
pkgrel=7
pkgdesc='Command-line AI assistant'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('custom:unlicensed')
depends=('chafa' 'gcc-libs' 'ripgrep')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
source=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('12d7b7f03d9e17affd5f65fe941061a58605af210b1917db252ffc53c245dc9d')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
}
