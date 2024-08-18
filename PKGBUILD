# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname=zsh-bitbake
pkgver=1.4.0
pkgrel=1
pkgdesc="Bitbake completion for zsh"
arch=("any")
url="https://github.com/antznin/zsh-bitbake"
license=("MIT")
depends=("zsh")
source=("https://github.com/antznin/zsh-bitbake/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("99f66b5b732146f49023de7c22a77da2a8ff125c09dcb98ef4e7bee1b6e010c4")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm644 zsh-bitbake.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-bitbake.plugin.zsh"
  install -Dm644 _bitbake "${pkgdir}/usr/share/zsh/plugins/$pkgname/_bitbake"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
