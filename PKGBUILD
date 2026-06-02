# Maintainer: Declan <dclnc@users.noreply.github.com>

pkgname=declan-setup
pkgver=0.1.0
pkgrel=1
pkgdesc="Declan's Omarchy dotfiles bootstrap command"
arch=('any')
url='https://github.com/dclnc/declan-dotfiles'
license=('MIT')
depends=('bash' 'git' 'sudo')
optdepends=('yay: install AUR packages from the bootstrap manifest')
source=('declan-setup')
sha256sums=('4f318531be17eea74115821f9eb1404d8541c160c86078530f860bdc537c4949')

package() {
  install -Dm755 declan-setup "$pkgdir/usr/bin/declan-setup"
}
