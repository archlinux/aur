# Maintainer: Declan <dclnc@users.noreply.github.com>

pkgname=declan-setup
pkgver=0.3.2
pkgrel=1
pkgdesc="Declan's Omarchy dotfiles bootstrap command"
arch=('any')
url='https://github.com/dclnc/declan-dotfiles'
license=('MIT')
depends=('bash' 'git' 'sudo')
optdepends=('yay: install AUR packages from the bootstrap manifest')
source=('declan-setup')
sha256sums=('e065834ca40d6abab0d790ef542ebd7bd2216777384c932b8f3f5ddc9dfb5c3d')

package() {
  install -Dm755 declan-setup "$pkgdir/usr/bin/declan-setup"
}
