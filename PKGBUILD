# Maintainer: Declan <dclnc@users.noreply.github.com>

pkgname=declan-setup
pkgver=0.2.0
pkgrel=2
pkgdesc="Declan's Omarchy dotfiles bootstrap command"
arch=('any')
url='https://github.com/dclnc/declan-dotfiles'
license=('MIT')
depends=('bash' 'git' 'sudo')
optdepends=('yay: install AUR packages from the bootstrap manifest')
source=('declan-setup')
sha256sums=('222f2ace8142794a9e2cbf94d7237b0c69201a2dd3a49741ca9ee4f3e5140520')

package() {
  install -Dm755 declan-setup "$pkgdir/usr/bin/declan-setup"
}
