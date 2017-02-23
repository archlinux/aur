# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=zsh-manydots-magic
pkgver=r10
_commit=f13ca5dcab9255157175b673ded82b6613455ce0
pkgrel=1
pkgdesc="zsh zle tweak for emulating \`...'==\`../..', etc."
arch=('any')
url='https://github.com/knu/zsh-manydots-magic'
license=('custom:BSD 2-clause')
depends=('zsh')
makedepends=('git')
source=("git+https://github.com/knu/${pkgname%-git}.git#commit=f13ca5dcab9255157175b673ded82b6613455ce0")
sha256sums=('SKIP')

package() {
  install -Dm644 ${pkgname%-git}/manydots-magic -t "$pkgdir/usr/share/zsh/functions/Zle"
  install -Dm644 ${pkgname%-git}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
