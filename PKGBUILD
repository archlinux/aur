# Maintainer: nbebaw <nader.bebawy@gmx.de>
pkgname=archub
pkgver=0.0.3
pkgrel=1
pkgdesc="Command-line tool designed for managing packages in AUR"
arch=(x86_64)
url="https://github.com/nbebaw/Archub"
license=(MIT)
depends=(git)
source=("https://github.com/nbebaw/Archub/releases/download/v${pkgver}/archub_${arch}.tar.gz")
sha256sums=('01ae2e23c0067aa9d7c40dbf5b54d8b527d4381a5b86cc0b4736d44dc6aeaebf')

package() {
  install -Dm755 archub -t "${pkgdir}/usr/bin/"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D auto_completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_archub"
}
