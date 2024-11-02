# Maintainer: Antonin Godard <antonin dot godard at pm dot me>

pkgname=zsh-bitbake
pkgver=1.5.1
pkgrel=1
pkgdesc="Bitbake completion for zsh"
arch=("any")
url="https://github.com/antznin/zsh-bitbake"
license=("MIT")
depends=("zsh")
source=("https://github.com/antznin/zsh-bitbake/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("39f20c94468328b7222f699298c0407973f2724066e90cd0bf3fca472b93d367")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm644 zsh-bitbake.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-bitbake.plugin.zsh"
  install -Dm644 _bitbake "${pkgdir}/usr/share/zsh/plugins/$pkgname/_bitbake"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
