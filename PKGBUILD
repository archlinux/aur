# Maintainer: timasoft <tima.klester@yandex.ru>

pkgname=wofi-vim
pkgver=1.0
pkgrel=5
pkgdesc="wofi menu to select Vim commands from cheat sheet"
arch=('any')
url="https://github.com/timasoft/wofi-vim.git"
license=('MIT')
depends=('wofi')
source=('wofi-vim.sh' 'vimcheat.txt')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/wofi-vim.sh" "${pkgdir}/usr/bin/wofi-vim"
  install -Dm644 "${srcdir}/vimcheat.txt" "${pkgdir}/usr/share/wofi-vim/vimcheat.txt"
}
