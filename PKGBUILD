# Maintainer: SHORiN <shorin@users.noreply.github.com>

pkgname=miyu
pkgver=0.1.5
pkgrel=1
pkgdesc='活在终端里的二次元少女'
arch=('x86_64')
url='https://github.com/SHORiN-KiWATA/Miyu'
license=('MIT')
options=('!strip' '!debug')
export LC_ALL=C.UTF-8
depends=('chafa' 'gcc-libs' 'ripgrep')
optdepends=(
  'git: update default Shorin Wiki knowledge base'
  'fish: fish shell integration support'
  'bash: bash shell integration support'
  'zsh: zsh shell integration support'
)
source=("${pkgname}-${pkgver}-${pkgrel}-${CARCH}.release.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('01e702f056283a8322f6fe022780d0d62b761903925658d008cce88e06422cec')

package() {
  install -Dm755 "${srcdir}/usr/bin/miyu" "${pkgdir}/usr/bin/miyu"
  cp -a "${srcdir}/usr/share" "${pkgdir}/usr/"
}
