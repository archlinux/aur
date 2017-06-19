# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=zsh-manydots-magic
pkgver=r11
_commit=4372de0718714046f0c7ef87b43fc0a598896af6
pkgrel=1
pkgdesc="zsh zle tweak for emulating \`...'==\`../..', etc."
arch=('any')
url='https://github.com/knu/zsh-manydots-magic'
license=('custom:BSD 2-clause')
depends=('zsh')
makedepends=('git')
source=("git+https://github.com/knu/${pkgname%-git}.git#commit=$_commit")
sha256sums=('SKIP')

package() {
  install -Dm644 ${pkgname%-git}/manydots-magic -t "$pkgdir/usr/share/zsh/functions/Zle"
  install -Dm644 ${pkgname%-git}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
