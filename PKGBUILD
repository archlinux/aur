# Maintainer: nbebaw <nader.bebawy@gmx.de>
pkgname=archub
pkgver=0.0.5
pkgrel=1
pkgdesc="Command-line tool designed for managing packages in AUR"
arch=(x86_64)
url="https://github.com/nbebaw/Archub"
license=(MIT)
depends=(git)
source=("https://github.com/nbebaw/Archub/releases/download/v${pkgver}/archub_${arch}.tar.gz")
sha256sums=('60e855f5938bee44eb8145c0a84965eb3bd25f322ee9690f3b4bfd483a28ba1c')

package() {
  install -Dm755 archub -t "${pkgdir}/usr/bin/"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D auto_completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_archub"
}
