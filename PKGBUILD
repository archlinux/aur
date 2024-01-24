# Maintainer: nbebaw <nader.bebawy@gmx.de>
pkgname=archub
pkgver=0.0.5
pkgrel=2
pkgdesc="Command-line tool designed for managing packages in AUR"
arch=(x86_64)
url="https://github.com/nbebaw/Archub"
license=(MIT)
depends=(git)
source=("https://github.com/nbebaw/Archub/releases/download/v${pkgver}/archub_${arch}.tar.gz")
sha256sums=('46b982d4acb897faf79442699c44654cdaaa6fb27a8628cea59a6a923b569c21')

package() {
  install -Dm755 archub -t "${pkgdir}/usr/bin/"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D auto_completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_archub"
}
