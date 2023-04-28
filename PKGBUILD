# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=fzf-kill
_pkgname=fzf-kill
pkgver=1.0
pkgrel=1
pkgdesc="Kill -9 with fzf"
arch=(any)
url="https://github.com/Zeioth/fzf-kill.git"
license=('GPL3')
depends=(fzf)
provides=(fzf-kill)
conflicts=(fzf-kill-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
   # Note: 'install' is a chmod+cp one-liner command by GNU
   mkdir -p "$pkgdir"/usr/bin
   install -m 555 "${srcdir}"/fzf-kill/fzf-kill "$pkgdir"/usr/bin/fzf-kill
}
