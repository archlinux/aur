# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=fzfkill
_pkgname=fzfkill
pkgver=1.0
pkgrel=1
pkgdesc="Kill -9 with fzf"
arch=(any)
url="https://github.com/Zeioth/fzfkill.git"
license=('GPL3')
depends=(fzf)
provides=(fzf-kill)
conflicts=(fzf-kill-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
   # Note: 'install' is a chmod+cp one-liner command by GNU
   mkdir -p "$pkgdir"/usr/bin
   install -m 555 "${srcdir}"/fzfkill/fzfkill "$pkgdir"/usr/bin/fzfkill
}
